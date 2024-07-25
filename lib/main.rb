require_relative 'board'
require_relative 'attempt'

game = Board.new
# while game.attempt_i < 12
#   game.do_attempt(game.attempt_i)
#   game.print_board
# end

while game.attempt_i < 12
  win = game.do_attempt
  if win
    puts 'You are the mastermind!'
    break
  end
end
