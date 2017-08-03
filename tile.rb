require 'colorize'

class Tile
  attr_writer :value, # value is either '@' or ' ' or a number
              :status # :untouched || :flagged || :revealed

  def initialize
    @status = :untouched # :untouched || :flagged || :revealed
    @value = ' '.on_light_white
  end

  def to_s
    if @status == :revealed
      @value
    elsif @status == :flagged
      'F'.red.on_light_white
    else # @status == :untouched
      '*'.on_light_white
    end
  end
end
