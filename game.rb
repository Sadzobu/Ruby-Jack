class Game
  attr_accessor :deck

  def initialize
    @deck = STARTING_DECK.clone
  end
end
