class Player
  attr_accessor :money_available, :current_cards, :name
  attr_reader :game

  def initialize(name, game)
    @name = name
    @money_available = 100
    @current_cards = []
    @game = game
  end

  def new_game
    self.current_cards = [pick_card, pick_card]
  end

  def hit
    current_cards << pick_card
  end

  def cards
    current_cards.length
  end

  def count_value
    total = 0
    current_cards.each do |x|
      total += if (value = x[0] % 13) > 10 || value.zero?
                 10
               else
                 value
               end
    end
    total += 10 if current_cards.any? { |x| x[0] % 13 == 1 } && total <= 11
    total
  end

  private

  def pick_card
    current_deck = game.deck
    picked_card = current_deck.to_a.sample
    current_deck.delete(picked_card[0])
    picked_card
  end
end
