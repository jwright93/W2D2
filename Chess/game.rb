require_relative 'board'
require_relative 'player'

class Game
  def initialize(player1,player2)
    @board = Board.new
    @player1 = Player.new(player1, @board)
    @player2 = Player.new(player2, @board)
    @current_player = @player1
  end

  def play
    until @board.won?
      puts "#{@current_player.name}"
      @current_player.play_turn
      @current_player = (@current_player == @player1 ? @player2 : @player1)
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new("Jon", "Steve").play
end
