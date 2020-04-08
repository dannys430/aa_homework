class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end
    if @game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    if !@game_over
      puts show_sequence
      
      if @seq.join(" ") != require_sequence
        @game_over = true
      end

      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "repeat the sequence"
    input = gets.chomp
    input
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "YOU GOT IT RIGHT!!!"
  end

  def game_over_message
    puts "you lost the game!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end


# s1 = Simon.new
# p s1.play
