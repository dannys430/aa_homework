require 'byebug'
require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    # debugger
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT 
        * 
      FROM 
        plays 
      WHERE 
        title = '#{title}'
    SQL
    data.map {|datum| Play.new(datum)}
  end 

  def self.find_by_playwright(name)
    # querying into the database
    info_from_db = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        plays
      JOIN
        playwrights ON plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = '#{name}'
    SQL
    #into_from_db.map is converting data retrieved from database into an instance of the Play class.  (Without this line, this method would return an array of hashes, where each hash has a key for 'id', 'title', 'year', 'playwright_id', etc.)
    info_from_db.map {|datum| Play.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  # ADDED A CLASS METHOD 'delete_by_title' THAT ACCEPTS A TITLE AND DELETES A RECORD THAT HAS THAT TITLE
  # def self.delete_by_title(title)
  #   # FIX RAISE!
  #   raise "#{title} not found in database!" unless PlayDBConnection.instance.execute("SELECT * FROM plays WHERE title = '#{title}'")
  #   PlayDBConnection.instance.execute(<<-SQL)
  #     DELETE FROM 
  #       plays 
  #     WHERE 
  #       plays.title = '#{title}'
  #   SQL
  #   # data.map {|datum| Play.new(datum)}
  # end
end


class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| Playwright.new(datum)}
  end

  def self.find_by_name(name)
    info_from_db = PlayDBConnection.instance.execute("SELECT * FROM playwrights WHERE name = '#{name}'")
  end

  def initialize(playwright_options)
    @id = playwright_options['id']
    @name = playwright_options['name']
    @birth_year = playwright_options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights(name, birth_year)
      VALUES
        (?, ?)
    SQL
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays

  end

end

############ PLAY
# show all instances of Play class
# p Play.all

# new_play = Play.new({'title'=>'Shakespeare', 'year'=>1650, 'playwright_id'=>5})
# new_play.create

# p Play.delete_by_title("Shakespeare")


############ PLAYWRIGHT
# show all instances of Playwright class
# p Playwright.all

# show all instances of Playwright class where name is "Eugene O''Neill"
# p Playwright.find_by_name("Eugene O''Neill")



# new_playwright = Playwright.new('name'=>'Shakespeare', 'birth_year'=>1545)
# new_playwright.create

