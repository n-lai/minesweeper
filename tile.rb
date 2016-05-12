class Tile
  attr_reader :bombed, :flagged, :revealed

  def initialize(bombed = false)
    @bombed = bombed
    @flagged = false
    @revealed = false
  end

  def reveal
    revealed = true
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def to_s
  end

end
