module Banking
  def self.included(base)
    base.include ClassMethods
  end

  module ClassMethods
    def split_money(player1, player2)
      give_money(player1, 10)
      give_money(player2, 10)
    end

    def place_bets(player1, player2)
      get_money(player1, 10)
      get_money(player2, 10)
    end

    def payout(player)
      give_money(player, 20)
    end

    private

    def get_money(player, amount)
      player.money_available -= amount
    end

    def give_money(player, amount)
      player.money_available += amount
    end
  end
end
