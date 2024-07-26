require 'colorize' # rubocop:disable Style/FrozenStringLiteralComment
require_relative 'place'

# Creates new object for each attempt
class Attempt
  attr_accessor :attempt_no, :secret_code_a

  def initialize(attempt_no, secret_code_a)
    @attempt_no = attempt_no
    @hint_s = ''
    @guesses_a = Array.new(4) { Place.new }
    @secret_code_a = secret_code_a
  end

  def set_color
    puts 'Enter position (1 to 4): '
    pos = 0
    loop do
      pos = gets.to_i
      break if pos in (1..4)

      puts 'Please enter a valid number (from 1 to 4)'
    end
    puts 'Enter color: '
    @guesses_a[pos - 1].color = (gets)
  end

  def hint_s
    return @hint_s if @guesses_a.any? { |place| place.color == '       ' }

    guesses_copy = []
    guesses_copy.replace(@guesses_a)

    4.times do |i|
      next unless guesses_copy[i].color == secret_code_a[i] # rubocop:disable Layout/EmptyLineAfterGuardClause
      @hint_s = "#{@hint_s}O"
      secret_code_a[i] = nil
      guesses_copy[i] = nil
    end

    guesses_copy.each do |place|
      next if place.nil? # rubocop:disable Layout/EmptyLineAfterGuardClause
      i = secret_code_a.index(place)
      @hint_s = i.nil? ? "#{@hint_s}X" : "#{@hint_s}C"
      secret_code_a[i] = nil unless i.nil?
    end

    @hint_s
  end

  def to_s
    "(#{COLORS[@guesses_a[0]]})   (#{COLORS[@guesses_a[1]]})   (#{COLORS[@guesses_a[2]]})   (#{COLORS[@guesses_a[3]]})\
       |  #{hint_s}"
  end
end
