require_relative 'board'
require_relative 'attempt'

game = Board.new
while game.attempt_i < 12
  game.do_attempt
  game.print_board
end
