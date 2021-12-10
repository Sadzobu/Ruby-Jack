class Player
  attr_accessor :money_available, :current_cards, :passed
  attr_reader :name

  def initialize(name)
    @name = name
    @money_available = 100
    @current_cards = []
    @passed = false
  end

  def new_game(deck)
    self.current_cards = [pick_card(deck), pick_card(deck)]
    self.passed = false
  end

  def hit(deck)
    current_cards << pick_card(deck)
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

  def pick_card(deck)
    picked_card = deck.to_a.sample
    deck.delete(picked_card[0])
    picked_card
  end
end
