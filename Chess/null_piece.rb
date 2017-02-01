require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @symbol = " "
    # super()
  end
  
  def moves(start_pos,board)
    []
  end
end
