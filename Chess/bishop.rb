require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (@color == :white ? '♗' : '♝')
  end

  def move_dirs
    SlidingPiece::DIAGONAL
  end

end
