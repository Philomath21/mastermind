require_relative 'attempt'

class Board
  attr_accessor :secret_code_a, :attempt_i

  def initialize
    @secret_code_a = %i[Red Green Blue Yellow]
    @board_s_a = Array.new(12) { '(       )   (       )   (       )   (       )' }
    @attempt_i = 0 # Current attempt number
  end

  def do_attempt(attempt_i)
    this_attempt = Attempt.new(attempt_i)
    loop do
      puts 'Position? (1 to 4) :'
      i = gets.chomp.to_i
      puts 'Color?'
      color = gets.chomp
      unless this_attempt.valid_color?(color)
        puts 'Please enter a valid color'
        break
      end
      case i
      when 1 then this_attempt.one = color.capitalize.to_sym
      when 2 then this_attempt.two = color.capitalize.to_sym
      when 3 then this_attempt.three = color.capitalize.to_sym
      when 4 then this_attempt.four = color.capitalize.to_sym
      else        puts 'Please enter a valid index'
      end

      break unless Attempt.give_hint_s(secret_code_a).nil?
    end
    @board_s_a[attempt_i] = this_attempt.to_s
    self.attempt_i = attempt_i + 1
  end

  def print_board
    puts "
  O : Means one of the colours is correct and in the right place
  C : Means one of the colours is correct but in the wrong place
  X : Means one of the colours is not in the sequence

      1           2           3           4
   "
    puts @board_s_a
  end
end
