require_relative 'banking'
require_relative 'interface'
require_relative 'starting_deck'

class Game
  include Banking
  include Interface

  attr_accessor :deck, :user, :dealer

  def initialize(user, dealer)
    @user = user
    @dealer = dealer
    @deck = STARTING_DECK.clone
  end

  def users_turn
    return if user.cards == 3 && dealer.cards == 3

    show_interface(user, dealer)
    show_menu
    user_input = gets.chomp
    case user_input
    when '1'
      if user.cards < 3
        user.hit(deck)
      else
        puts 'Cant take any more cards!'
      end
      dealers_turn
    when '2'
      dealers_turn
    end
  end

  def dealers_turn
    dealer.hit(deck) if dealer.count_value < 17 && dealer.cards < 3
    users_turn
  end

  def play_turn
    show_interface(user, dealer)
    shuffle_deck
    user.new_game(deck)
    dealer.new_game(deck)
    place_bets(user, dealer)
    users_turn
    winner = define_winner
    winner.nil? ? split_money(user, dealer) : payout(winner)
    show_results(user, dealer, winner)
  end

  def ready_to_play?
    if user.money_available > 10
      show_invitation
      gets.chomp != 'E'
    elsif dealer.money_available < 10
      puts 'Dealer has no money, you won!'
      false
    else
      puts "Sorry, you don't have enough money to play!"
      false
    end
  end

  def define_winner
    if user.count_value < 22 && user.count_value == dealer.count_value
      nil
    elsif dealer.count_value > 21 || user.count_value < 22 && (21 - user.count_value < 21 - dealer.count_value)
      user
    else
      dealer
    end
  end

  def shuffle_deck
    self.deck = STARTING_DECK.clone
  end
end
