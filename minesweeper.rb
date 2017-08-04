require 'colorize'
require_relative 'board'


class MinesweeperGame
  attr_reader :board
  EXPLOSION = '💥'.on_light_white
  BOMB = '💣'.on_light_white
  FLAG = '🚩'.on_light_white

  def initialize(options = {})
    default = { board: Board.new, bomb_count: 10 }
    default = default.merge(options)
    @board = default[:board]
    @bomb_count = default[:bomb_count]
  end

  def populate_bombs
    @bomb_coordinates = @board.list_of_coordinates.sample(@bomb_count)
    @bomb_coordinates.each do |pos|
      @board[pos].value = BOMB
    end
  end

  def populate_numbers
    @bomb_coordinates.each do |bomb_pos|
      adjacent_coordinates(bomb_pos).each do |adj_pos|
        value = @board[adj_pos].value # is either @ or ' ' or digit string

        @board[adj_pos].value = (value.uncolorize.to_i + 1).to_s.on_light_white unless value == BOMB
      end
    end
  end

  def adjacent_coordinates(pos)
    row, col = pos
    result = []

    result << [row - 1, col - 1] if row > 0 && col >= 0 # upleft
    result << [row - 1, col] if row > 0 # up
    result << [row - 1, col + 1] if row > 0 && @board[[row - 1, col + 1]] # upright
    result << [row, col + 1 ] if @board[[row, col + 1]] # right
    result << [row + 1, col + 1] if @board[[row + 1, col + 1]] # rightdown
    result << [row + 1, col] if @board[[row + 1, col]] # down
    result << [row + 1, col - 1] if col > 0 && @board[[row + 1, col - 1]] # downleft
    result << [row, col - 1] if col > 0 # left

    result
  end

  def play
    play_turn until game_over?
  end

  def play_turn
    get_coordinate
  end

  private

  def get_coordinate
    puts 'Please enter coordinates (e.g. I,A for top-right)'
    gets.chomp.split(/\,?\s*/).reverse
  end

  def game_over?
  end
end

if __FILE__ == $0
  g = MinesweeperGame.new
  g.populate_bombs
  g.populate_numbers
  g.board.render
end
