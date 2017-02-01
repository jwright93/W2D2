require_relative 'piece'
require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece
  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (@color == :white ? '♕' : '♛')
  end

  def move_dirs
    (SlidingPiece::HORIZONTAL)
      .merge(SlidingPiece::VERITCAL)
        .merge(SlidingPiece::DIAGONAL)
  end
end
