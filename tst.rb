# frozen_string_literal: true

require_relative 'starting_deck'
require_relative 'player'
require_relative 'game'

require_relative 'interface'

class Main
  include Interface

  def initialize
    show_greetings
    user_name = gets.chomp
    new_game = Game.new
    user = Player.new(user_name, new_game)
    dealer = Player.new('Dealer', new_game)
    new_game.play_turn(new_game, user, dealer) while new_game.ready_to_play?(user)
  end
end

Main.new
