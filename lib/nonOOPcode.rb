# board
# chances
# hint indicator
# code setter
# player
require 'colorize'

def user_guess
  guess_arr = Array.new(4)
  loop do
    puts 'Index? (1 to 4) :'
    i = gets.chomp.to_i
    puts 'Color?'
    color = gets.chomp.to_sym
    guess_arr[i - 1] = color
    break unless guess_arr.any?(&:nil?)
  end
  guess_arr
end

def show_hint(guess_arr, secrete_code)
  temp_sc = secrete_code
  temp_ga = guess_arr
  x = 0
  o = 0
  c = 0

  temp_ga.each_with_index do |guess, index|
    next unless guess == temp_sc[index]

    o += 1
    temp_sc[index] = nil
    temp_ga[index] = nil
  end

  temp_ga.each_with_index do |guess, index| # rubocop:disable Style/CombinableLoops
    next if guess.nil?

    i = temp_sc.index(guess)
    if i.nil?
      x += 1
    else
      c += 1
      temp_sc[i] = nil
    end
    temp_ga[index] = nil
  end

  hint = ''
  x.times { "X#{hint}" }
  c.times { "C#{hint}" }
  o.times { "O#{hint}" }

  hint
end

colors = {
  Red: '  Red  '.colorize(:red),
  Green: ' Green '.colorize(:green),
  Blue: ' Blue  '.colorize(:blue),
  Yellow: 'Yellow '.colorize(:yellow),
  Gray: ' Gray  '.colorize(:gray),
  Cyan: ' Cyan  '.colorize(:cyan),
  Magenta: 'Magenta'.colorize(:magenta),
  Orange: 'Orange '.colorize(:light_red)
}

def push_to_board(board_a, attempt_no, guess_arr, hint, colors)
  board_a[attempt_no - 1] = "(#{colors[guess_arr[0]]})   (#{colors[guess_arr[1]]})   (#{colors[guess_arr[2]]})   \
  (#{colors[guess_arr[3]]})   |  #{hint}"
end

def print_board(board_a)
  puts "
O : Means one of the colours is correct and in the right place
C : Means one of the colours is correct but in the wrong place
X : Means one of the colours is not in the sequence

    1           2           3           4
 "
  puts board_a
end

def play_game(colors)
  secrete_code = %i[Red Green Blue Yellow]
  attempts = 12
  guesses_hash = {}
  board_a = Array.new(12) { '(       )   (       )   (       )   (       )' }

  attempts.times do |attempt_no|
    guess_arr = user_guess
    hint = show_hint(guess_arr, secrete_code)
    guesses_hash[guess_arr] = hint
    push_to_board(board_a, attempt_no, guess_arr, hint, colors)
    print_board(board_a)
    p colors.values
  end
end
