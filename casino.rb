require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'highlow'
require_relative 'wallet'
require_relative 'slots'
require_relative 'playerTwo'

class Casino
	attr_accessor :player, :wallet, :bank_roll, :cards
  def initialize
  	puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
    menu
  end

  	def menu
  	puts "----Games---"
  	choice_1 = "\nHighlow\nBlackjack\nSlots\nTake A Chance In The Bathroom\nUse ATM\nSwitch Player\nExit Casino\n "
    puts choice_1
  	puts "Please Select One"
  	choice = gets.strip.downcase
  	case choice
      when "highlow"
  			Highlow.new(player, self)
  		when "blackjack"
  			Blackjack.new(player, self)
      when "slots"
        Slots.new(player, self)
  		when "bathroom", "take", "a", "chance", "in", "the"
  			Bathroom.new(player, self)
      when "switch", "player"
        PlayerTwo.new(self)
  		when "exit", "casino"
  			exit
  		else
  			puts "Please select from the choices above."
  			menu
		end
  end
end

Casino.new
