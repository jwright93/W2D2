require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (@color == :white ? '♖' : '♜')
  end

  def move_dirs
    (SlidingPiece::HORIZONTAL).merge(SlidingPiece::VERITCAL)
  end

end
