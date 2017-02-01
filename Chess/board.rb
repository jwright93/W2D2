require_relative 'piece'
require_relative 'null_piece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "Invalid starting location." if self[start_pos].nil?
    raise ArgumentError.new "Invalid ending location." unless self[end_pos].nil?

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def in_bounds(pos)
    pos.each do |position|
      return false if position > 7 || position < 0
    end
    true
  end

  def update(start_pos, end_pos)
    if valid_move?(start_pos,end_pos)
      self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
    end
  end

  def won?
    grid.flatten.select { |cell| cell.is_a?(King) }.length == 1
  end

  private

  def fill_row(start_row, color)
    pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]

    pieces.each_with_index do |piece, j|
      self[[start_row, j]] = piece.new(color)
    end
  end

  def fill_pawn(start_row, color)
    (0...grid.length).each do |j|
      self[[start_row, j]] = Pawn.new(color)
    end
  end

  def place_pieces
    @grid.each_index do |i|
      (0...grid.length).each do |j|
        if i > 1 && i < 6
          self[[i, j]] = NullPiece.instance
        elsif i == 0
          fill_row(i, :black)
          fill_pawn(i + 1, :black)
          break
        elsif i == 6
          fill_pawn(i, :white)
          fill_row(i + 1, :white)
          break
        end
      end
    end
  end

  def valid_move?(start_pos,ending_pos)
    self[start_pos].moves(start_pos, self).include?(ending_pos)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts Board.new.grid
end
