require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (@color == :white ? '♔' : '♚')
  end

  def move_dirs
    (SteppingPiece::HORIZONTAL)
      .merge(SteppingPiece::VERITCAL)
        .merge(SteppingPiece::DIAGONAL)
  end
end
