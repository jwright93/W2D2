module SteppingPiece
  HORIZONTAL = {
    right: [0, 1],
    left:  [0,-1]
  }

  VERITCAL = {
    up:   [-1, 0],
    down: [ 1, 0]
  }

  DIAGONAL = {
    up_left:    [-1,-1],
    up_right:   [-1, 1],
    down_left:  [ 1,-1],
    down_right: [ 1, 1]
  }

  KNIGHT_MOVES = {
    far_down_right: [ 1,  2],
    far_down_left:  [-1,  2],
    far_right_up:   [ 2, -1],
    far_right_down: [ 2,  1],
    far_up_left:    [-1, -2],
    far_up_right:   [ 1, -2],
    far_left_down:  [-2,  1],
    far_left_up:    [-2, -1]
  }


  def moves(start_pos, board)
    possible_moves = []

    move_dirs.each do |dir,pos|
      pos_move = [start_pos[0] + pos[0], start_pos[1] + pos[1]]
      possible_moves << pos_move if board.in_bounds(pos_move)
    end

    possible_moves
  end
end
