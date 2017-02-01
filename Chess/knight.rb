require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (@color == :white ? '♘' : '♞')
  end

  def move_dirs
    SteppingPiece::KNIGHT_MOVES
  end
end
