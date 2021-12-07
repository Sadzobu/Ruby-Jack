# frozen_string_literal: true

require_relative 'starting_deck'
require_relative 'player'
require_relative 'game'

new_game = Game.new
user = Player.new("E", new_game)
dealer = Player.new("D", new_game)
user.new_game
user.show
dealer.new_game
dealer.show
user.deal
user.show
