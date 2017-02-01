class Piece

  DIRECTIONS = {
    right: [0,1],
    left: [0,-1],
    up: [-1,0],
    down: [1,0],
    up_left: [-1,-1],
    up_right: [-1,1],
    down_left: [1,-1],
    down_right: [1,1]
  }

  attr_reader :color

  def initialize(color = nil)
    @color = color
  end


  def to_s
  end

  def empty?
  end

  def symbol
  end


end
