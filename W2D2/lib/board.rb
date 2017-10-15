class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos <= 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].count
    @cups[start_pos] = []
    next_cup = (start_pos + 1) % 13
    until stones == 0
      next_cup = 0 if next_cup > 13
      if current_player_name == @name1 && next_cup == 13
        next_cup += 1
      elsif current_player_name == @name2 && next_cup == 6
        next_cup += 1
      else
        @cups[next_cup] << :stone
        stones -= 1
        next_cup += 1
      end
    end
    self.render
    next_turn(next_cup - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].count == @cups[13].count
      :draw
    elsif @cups[6].count > @cups[13].count
      @name1
    else
      @name2
    end
  end
end
