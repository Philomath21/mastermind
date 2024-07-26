# frozen_string_literal: true

require_relative 'board'
require_relative 'attempt'
require 'pry-byebug'

game = Board.new
# while game.attempt_i < 12
#   game.do_attempt(game.attempt_i)
#   game.print_board
# end

while game.attempt_i < 12
  win = game.do_attempt(game.attempt_i)
  puts 'You are the mastermind!' if win
  break if win
end
puts 'You lost!' unless win
