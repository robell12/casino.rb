require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'highlow'
require_relative 'wallet'
require_relative 'slots'
require_relative 'playertwo'
require_relative 'bathroom'
require_relative 'blackjack'

class Casino
	attr_accessor :player, :bank_roll, :cards
  def initialize
  	puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
    menu
  end

  def menu
  	puts "----Games---"
  	choice_1 = "\nHighlow\nBlackjack\nSlots\nTake A Chance\nUse ATM\nSwitch Player\nExit Casino\n "
    puts choice_1
  	puts "Please Select One"
  	choice = gets.strip.downcase
  	case choice
      when "highlow"
  			Highlow.new(player, self)
  		when "blackjack"
  			Blackjack.new
      when "slots"
        Slots.new(player, self)
  		when "take", "a", "chance", "take a chance"
  			Bathroom.new(player, self)
      when "switch", "player", "switch player"
        PlayerTwo.new(self)
      when "use", "atm", "use atm"
      	atm
  		when "exit", "casino", "exit casino"
  			exit
  		else
  			puts "Please select from the choices above."
  			menu
		end
  end

  def atm
			puts "How much money do you want to take out?"
			money = gets.to_i
			player.bank_roll = player.bank_roll + money
			puts "Please wait while we process your card..."
			puts "Your transaction was successful."
			puts "You now have #{player.bank_roll}!"
			menu
	end
end

Casino.new
