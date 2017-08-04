require 'colorize'

class Tile
  attr_accessor :value, # value is either '@' or ' ' or a number
              :status # :untouched || :flagged || :revealed

  def initialize
    # @status = :untouched # :untouched || :flagged || :revealed
    @status = :revealed # :untouched || :flagged || :revealed
    @value = ' '.on_light_white
  end

  def to_s
    if @status == :revealed
      @value
    elsif @status == :flagged
      MinesweeperGame::FLAG
    else # @status == :untouched
      '*'.on_light_white
    end
  end

  def reveal!

  end

  def colorize_num!(num_str)
    # case num_str.uncolorize.

  end
end
