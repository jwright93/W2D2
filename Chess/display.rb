require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display
  def initialize(pos = [0, 0], board = Board.new)
    @cursor = Cursor.new(pos, board)
    @board = board
  end

  def render(name)
    system('clear')
    puts "It is #{name}\'s turn."
    @board.grid.each_with_index do |row, i|

      row.each_with_index do |piece, j|

        if @cursor.cursor_pos == [i, j]
          print " #{piece.symbol} ".on_red
        elsif i.odd? && j.odd? || i.even? && j.even?
          print " #{piece.symbol} ".on_light_black
        # elsif
        #   print " #{piece.symbol} ".on_light_black
        else
          print " #{piece.symbol} ".on_white
        end
      end
      puts
    end
  end

  def get_input
    @cursor.get_input
  end

end

if __FILE__ == $PROGRAM_NAME
  Display.new.loop
end
