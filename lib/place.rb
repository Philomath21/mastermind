require 'colorize'

COLORS = {
  Red: '  Red  '.colorize(:red),
  Green: ' Green '.colorize(:green),
  Blue: ' Blue  '.colorize(:blue),
  Yellow: 'Yellow '.colorize(:yellow),
  Gray: ' Gray  '.colorize(:gray),
  Cyan: ' Cyan  '.colorize(:cyan),
  Magenta: 'Magenta'.colorize(:magenta),
  Orange: 'Orange '.colorize(:light_red),
  "       ": '       '
}.freeze

# Creates new color object for all 4 places
class Place
  attr_reader :color

  def initialize
    @color = '       '
  end

  def color=(col)
    col = col.capitalize.to_sym
    if COLORS.include? col
      self.color = col
    else
      puts 'Please enter a valid color input'
    end
  end

  def to_s
    color
  end
end
