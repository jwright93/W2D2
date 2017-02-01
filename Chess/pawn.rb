require 'byebug'
require_relative 'piece'
require_relative 'stepping_piece'
require_relative 'null_piece'

class Pawn < Piece
  include SteppingPiece
  attr_reader :symbol

  def initialize(color)
    super
    @symbol = (color == :white ? '♙' : '♟')
  end

  def move_dirs
    SteppingPiece::VERITCAL
      .merge(SteppingPiece::DIAGONAL)
       .select do |dir, pos|
         if @color == :white
           pos[0] < 0
         else
           pos[0] > 0
         end
       end

  end

  def moves(start_pos, board)
    possible_moves = []

    move_dirs.each do |dir, pos|
      pos_move = [start_pos[0] + pos[0], start_pos[1] + pos[1]]
      if board.in_bounds(pos_move)
        #if pos_move is not a diagonal and is empty, add to possible_moves
        if board[pos_move].empty? && !SteppingPiece::DIAGONAL.has_key?(dir)
          possible_moves << pos_move
        # else
        #   possible_moves << pos_move
        end
      end
    end

    possible_moves
  end


    def moves(start_pos, board)
      possible_moves = []

      move_dirs.each do |dir,pos|
        pos_move = [start_pos[0] + pos[0], start_pos[1] + pos[1]]
        possible_moves << pos_move if board.in_bounds(pos_move)
      end

      possible_moves
    end
end
