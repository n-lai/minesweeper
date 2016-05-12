class Tile
  attr_reader :bombed, :flagged, :revealed, :board

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
  end

  def neighbor_bomb_count
  end

  def to_s
    if revealed
      "*"
    end
  end

end
