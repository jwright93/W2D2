require_relative 'null_piece'

module SlidingPiece

  HORIZONTAL = {
    right:[0, 1],
    left: [0,-1]
  }

  VERITCAL = {
    up:   [-1,0],
    down: [ 1,0]
  }

  DIAGONAL = {
    up_left:   [-1,-1],
    up_right:  [-1, 1],
    down_left: [ 1, -1],
    down_right:[ 1, 1]
  }

  def moves(start_pos, board)
    possible_moves = []

    move_dirs.each do |dir,pos|
      pos_move = [start_pos[0] + pos[0], start_pos[1] + pos[1]]

      while board.in_bounds(pos_move)
        if board[pos_move] != NullPiece.instance
          possible_moves << pos_move unless board[pos_move].color == @color
          break
        end
        possible_moves << pos_move
        pos_move = [pos_move[0] + pos[0], pos_move[1] + pos[1]]
      end
    end

    possible_moves
  end
end
