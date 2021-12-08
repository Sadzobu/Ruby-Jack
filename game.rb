require_relative 'banking'
require_relative 'interface'

class Game
  include Banking
  include Interface

  attr_accessor :deck

  def initialize
    @deck = STARTING_DECK.clone
  end

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
        puts 'Cant take any more cards!'
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

  def ready_to_play?(user)
    if user.money_available > 10
      show_invitation
      gets.chomp != 'E'
    else
      puts "Sorry, you don't have enough money to play!"
      false
    end
  end

  def define_winner(player1, player2)
    if player1.count_value < 22 && player1.count_value == player2.count_value
      nil
    elsif player2.count_value > 21 || player1.count_value < 22 && (21 - player1.count_value < 21 - player2.count_value)
      player1
    else
      player2
    end
  end

  def shuffle_deck
    self.deck = STARTING_DECK.clone
  end
end
