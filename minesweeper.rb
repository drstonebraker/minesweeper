require 'colorize'
require_relative 'board'

class MinesweeperGame
  # attr_reader :board

  def initialize(options = {})
    default = { board: Board.new, bomb_count: 10 }
    default = default.merge(options)
    @board = default[:board]
    @bomb_count = default[:bomb_count]
  end

  def populate_bombs
    bomb_coordinates = @board.list_of_coordinates.sample(@bomb_count)
    bomb_coordinates.each do |pos|
      @board[pos].value = '@'.black.on_red
    end
  end

  def play
    play_turn until game_over?
  end

  def play_turn
    puts ""
  end

  def game_over?
  end
end

if __FILE__ == $0
  g = MinesweeperGame.new
  g.populate_bombs
  g.board.render
end
