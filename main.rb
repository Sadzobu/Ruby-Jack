# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

class Main
  def initialize
    puts 'Welcome to Ruby Jack game!'
    puts 'Please, enter your name:'
    user_name = gets.chomp
    user = Player.new(user_name)
    dealer = Player.new('Dealer')
    new_game = Game.new(user, dealer)
    new_game.play_turn while new_game.ready_to_play?
  end
end

Main.new
