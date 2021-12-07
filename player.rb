class Player
  STARTING_MONEY = 100

  attr_accessor :money_availabe, :card_value, :current_cards
  attr_reader :game

  def initialize(name, game)
    @name = name
    @money_availabe = STARTING_MONEY
    @current_cards = []
    @card_value = 0
    @game = game
  end

  def new_game
    current_deck = game.deck
    picked_cards = [rand(1..current_deck.length), rand(1..current_deck.length)]
    self.current_cards = [current_deck[picked_cards[0]], current_deck[picked_cards[1]]]
    picked_cards.each do |card|
      current_deck.delete(card)
      self.card_value += count_value(card)
    end
  end

  def show
    current_deck = game.deck
    current_cards.each { |x| print "#{x} " }
    print "Card Value: #{card_value} "
    puts "Deck Length : #{current_deck.length}"
  end

  def deal
    current_deck = game.deck
    picked_card = rand(1..current_deck.length)
    current_cards << current_deck[picked_card]
    self.card_value += count_value(picked_card)
    current_deck.delete(picked_card)
  end

  def fold
  end

  def flip
  end

  def hit
  end

  private

  def count_value(x)
    case x % 13
    when (2..10)
      x % 13
    when 0, 11, 12
      10
    else
      1
    end
  end
end
