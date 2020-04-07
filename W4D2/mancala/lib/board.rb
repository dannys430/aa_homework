class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @cups.each_with_index do |cup, idx|
      # unless the cup is a player's store cup, put 4 stones in the cup
      unless idx == 6 || idx == 13
          4.times {cup << :stone }
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    
      raise "Invalid starting cup" unless @cups.index(start_pos) != nil
    
      raise "Starting cup is empty" if @cups.index(start_pos) != nil && @cups[start_pos].empty?
    
  end

  def make_move(start_pos, current_player_name)
    selected_cup = start_pos              # idx 2
    stones = []   # 4
    until @cups[selected_cup].empty?
      stones << @cups[selected_cup].pop
    end
    
    until stones.empty?
      next_cup = selected_cup + 1
      ending_cup = next_cup + (stones.length - 1)
      @cups[next_cup..ending_cup].each_with_index do |cup, idx|
        if idx != @cups[13]
          cup << stones.pop 
        end
      end
      
    end 
    
    if @cups[ending_cup].empty?
      return :switch
    end
    
    
         
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  # PRINT OUT BOARD
  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  # CHECK IF ONE SIDE OF BOARD IS EMPTY
  def one_side_empty?
  end

  # CHECK FOR WINNER
  def winner
  end
end
