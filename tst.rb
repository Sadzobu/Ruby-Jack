# frozen_string_literal: true

require_relative 'starting_deck'
require_relative 'player'
require_relative 'game'
require_relative 'banking'
require_relative 'interface'

class Main
  include Banking
  include Interface

  def users_turn(user, dealer)
    if user.cards == 3 && dealer.cards == 3
      return
    end

    show_interface(user, dealer)
    show_menu
    user_input = gets.chomp
    case user_input
    when '1'
      if user.cards < 3
        user.hit
      else
        puts 'cant take any more cards'
      end
      dealers_turn(user, dealer)
    when '2'
      dealers_turn(user, dealer)
    when '3'
      return
    end
  end

  def dealers_turn(user, dealer)
    if dealer.count_value < 17 && dealer.cards < 3
      dealer.hit
    end
    users_turn(user, dealer)
  end

  def play_turn(game, user, dealer)
    show_interface(user, dealer)
    game.shuffle_deck
    user.new_game
    dealer.new_game
    place_bets(user, dealer)
    users_turn(user, dealer)
    winner = game.define_winner(user, dealer)
    winner.nil? ? split_money(user, dealer) : payout(winner)
    show_results(user, dealer, winner)
  end

  def ready_to_play?
    show_invitation
    user_input = gets.chomp
    case user_input
    when 'E'
      false
    else
      true
    end
  end

  def flip
  end

  def main
    show_greetings
    user_name = gets.chomp
    new_game = Game.new
    user = Player.new(user_name, new_game)
    dealer = Player.new('Dealer', new_game)
    play_turn(new_game, user, dealer) while ready_to_play?
  end
end

a = Main.new
a.main
