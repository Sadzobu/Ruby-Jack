class Player
  attr_accessor :money_available, :card_value, :current_cards, :name
  attr_reader :game

  def initialize(name, game)
    @name = name
    @money_available = 100
    @current_cards = []
    @card_value = 0
    @game = game
  end

  def new_game
    self.card_value = 0
    self.current_cards = [pick_card, pick_card]
    current_cards.each do |card|
      self.card_value += count_value(card[0])
    end
  end

  def deal
    picked_card = pick_card
    current_cards << picked_card
    self.card_value += count_value(picked_card[0])
  end

  def cards
    current_cards.length
  end

  private

  def pick_card
    current_deck = game.deck
    picked_card = current_deck.to_a.sample
    current_deck.delete(picked_card[0])
    picked_card
  end

  def count_value(card_number)
    case card_number % 13
    when (2..10)
      card_number % 13
    when 0, 11, 12
      10
    else
      1
    end
  end
end
