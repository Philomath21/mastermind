require_relative 'attempt'

class Board
  BOARD_TOP = "
  O : Means one of the colours is correct and in the right place
  C : Means one of the colours is correct but in the wrong place
  X : Means one of the colours is not in the sequence

    1           2           3           4       hint
     ".freeze

  EMPTY_ROW = '(       )   (       )   (       )   (       )'.freeze

  attr_accessor :secret_code_a, :attempt_i

  def initialize
    @secret_code_a = %i[Red Green Blue Yellow]
    # @board_s_a = Array.new(12) { '(       )   (       )   (       )   (       )' }
    @board_s_a = []
    @attempt_i = 0 # Current attempt number
  end

  def winner?(hint_s)
    hint_s == 'OOOO'
  end

  def do_attempt(attempt_i)
    this_attempt = Attempt.new(attempt_i, secret_code_a)

    loop do
      puts BOARD_TOP
      puts @board_s_a
      puts this_attempt
      # binding.pry
      guessed = this_attempt.hint_s
      unless guessed.empty?
        puts 'Do you want to submit your guess?(y or n)'
        break if gets.downcase.chomp == 'y'
      end
      (12 - 1 - attempt_i).times { puts EMPTY_ROW }
      this_attempt.set_color
    end

    board_s_a.push this_attempt.to_s
    self.attempt_i = attempt_i + 1
    winner?(this_attempt.hint_s)

    # loop do
    #   puts 'Position? (1 to 4) :'
    #   i = gets.chomp.to_i
    #   puts 'Color?'
    #   color = gets.chomp
    #   unless this_attempt.valid_color?(color)
    #     puts 'Please enter a valid color'
    #     next
    #   end
    #   case i
    #   when 1 then this_attempt.one = color.capitalize.to_sym
    #   when 2 then this_attempt.two = color.capitalize.to_sym
    #   when 3 then this_attempt.three = color.capitalize.to_sym
    #   when 4 then this_attempt.four = color.capitalize.to_sym
    #   else
    #     puts 'Please enter a valid index'
    #     next
    #   end

    #   break unless this_attempt.give_hint_s(secret_code_a).nil?
    # end
    # @board_s_a[attempt_i] = this_attempt.to_s

    # self.attempt_i = attempt_i + 1
  end
end
