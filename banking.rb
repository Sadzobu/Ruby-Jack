module Banking
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    def split_money(user, dealer)
      give_money(user, 10)
      give_money(dealer, 10)
    end

    def place_bets(user, dealer)
      get_money(user, 10)
      get_money(dealer, 10)
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
