require_relative 'tile'

class Board
  MAX_BOMBS = 9
  attr_reader :grid

  def initialize(size = 9)
    @grid = Array.new(size) { Array.new(size) }
    bombs_placed = 0

    until bombs_placed == MAX_BOMBS
      random_coord_x = rand(0...size)
      random_coord_y = rand(0...size)

      unless grid[random_coord_x][random_coord_y].is_a?(Tile)
        grid[random_coord_x][random_coord_y] = Tile.new(true)
        bombs_placed += 1
      end
    end

    grid.each_with_index do |row, idx|
      row.each_index { |column| grid[idx][column] = Tile.new if grid[idx][column].nil? }
    end

  end

  def num_of_bombs
    @grid.flatten.count { |tile| tile.bombed }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = grid[x][y]
    tile.value = value
  end

  def loss?
  end


end
