class Game
  attr_accessor :deck

  def initialize
    @deck = STARTING_DECK.clone
  end

  def define_winner(player1, player2)
    if player1.card_value < 22 && player1.card_value == player2.card_value
      return nil
    elsif player2.card_value > 21 || player1.card_value < 22 && (21 - player1.card_value < 21 - player2.card_value)
      return player1
    else
      return player2
    end
  end

  def shuffle_deck
    self.deck = STARTING_DECK.clone
  end


end
