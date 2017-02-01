require_relative 'display'

class Player
  attr_reader :name

  def initialize(name, board)
    @name = name
    @board = board
    @display = Display.new([0,0],board)
  end

  def play_turn
    from, to = nil

    until from
      @display.render(name)
      from = @display.get_input
    end

    until to
      @display.render(name)
      to = @display.get_input
    end

    @board.update(from, to)
    
  end
end
