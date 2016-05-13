class Tile
  attr_reader :bombed, :flagged, :revealed, :board, :position

  def initialize(board, position, bombed = false)
    @bombed = bombed
    @flagged = false
    @revealed = false
    @position = position
    @board = board
  end

  def reveal
    revealed = true
  end

  def neighbors
    neighbors_array = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        next if i == 0 && j == 0
        neighbors_array << [position.first + i, position.last + j]
      end
    end

    neighbors_array.select { |array| array.first.between?(0, board.grid.size - 1) && array.last.between?(0, board.grid.size - 1) }

  end

  def neighbor_bomb_count
    neighbor_array = self.neighbors
    neighbor_array.count do |pos|
      board.grid[pos.first][pos.last].bombed
    end
  end

  def to_s
    if bombed
      print "X"
    elsif neighbor_bomb_count > 0
      print neighbor_bomb_count
    else
      print "*"
    end
  end

end
