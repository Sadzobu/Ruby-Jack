module Interface
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    def show_greetings
      puts 'Welcome to Ruby Jack game!'
      puts 'Please, enter your name:'
    end

    def show_invitation
      puts 'Ready to play?'
      puts "Press 'E' to exit or press anything else to continue:"
    end

    def show_menu
      puts 'Choose action:'
      puts "Press '1' to hit a new card"
      puts "Press '2' to pass turn to the Dealer"
      puts "Press '3' to flip cards, and see the results"
    end

    def show_interface(user, dealer)
      puts "\e[H\e[2J"
      show_board_state(user)
      show_stealth_state(dealer)
    end

    def show_results(user, dealer, winner)
      puts "\e[H\e[2J"
      show_board_state(user)
      show_board_state(dealer)
      if winner.nil?
        puts 'It was a tie!'
      else
        puts "#{winner.name} won!"
      end
    end

    private

    def show_cards(player)
      player.current_cards.each { |x| print "#{x[1]} " }
    end

    def show_value(player)
      print player.count_value
    end

    def show_money_available(player)
      print player.money_available
    end

    def show_board_state(player)
      print "#{player.name}\'s cards:   "
      show_cards(player)
      print '     current cards value:'
      show_value(player)
      print '     and available money:'
      show_money_available(player)
      puts
    end

    def show_stealth_state(player)
      print "#{player.name}\'s cards:   "
      player.current_cards.each { |_x| print '* ' }
      print '     current cards value: *'
      print '     and available money:'
      show_money_available(player)
      puts
    end
  end
end
