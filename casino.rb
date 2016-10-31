# start game player with name and money (class)
# menu directs player to a game (slots, high low)
# places bet and wins or loses (rand)
# player is deducted bankroll when lose and adds when wins
# ----bonus
# option to move through menu to other games
# switch players with new name and money (class)
# while moving games the money stays the same
# when you switch to other player, their money stays the same
# random events occure while switching games and win loses money
# roulette, craps, card game
# create new game

require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'highlow'
require_relative 'wallet'


# module Start
class Casino
	attr_accessor :player, :wallet, :bank_roll, :cards
  def initialize
  	puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
    menu
  end

  	#pass player instance into each game
  	#to class needed acces to player
  	def menu
  	puts "----Games---"
  	choice_1 = "\nHighlow\nBlackjack\nTake a chance in the bathroom\nMake See Wallet\nUse ATM\nExit Casio\n "
  	 
  	puts choice_1
  	puts "Please select one"
  	choice = gets.strip.downcase
  	case choice
    when choice_1 ="highlow"
			Highlow.new(player)
		when "blackjack"
			Blackjack.new(player)
		when "bathroom", "take", "a", "chance", "in", "the"
			Bathroom.new(player)
		when "wallet", "see", "make"
		   # binding.pry
		  Wallet.new(player, self)
		# when "use", "atm"
		# 	atm
		when "exit", "casino"
			exit
		else
			puts "Please select from the choices above."
			menu
		end
  end

	# def wallet
	# 	puts "You have $#{player.bank_roll} in your hand."
	# 	puts "Do you want to put it in your wallet? yes/no"
	# 	money = gets.strip
	# 	case money
	# 	when "yes"
	# 		@wallet = @bank_roll
	# 	  puts "Do you have credit cards? yes/no"
	# 	  choose = gets.strip
	#       case choose
	# 	   	when "yes"
	# 	   		puts "How many cards do you have?"
	# 	   		@cards = gets.to_i
	# 	    	puts "You have #{@cards} credit cards"
	# 	    else
	# 	    	puts "No ATM for you"
	# 	    	binding.pry
	# 	    	menu
	# 	    end
	# 	else
	# 		puts "You might get robbed!"
	# 		menu
	# 	end
	# end

	# def atm
	# 		puts "How much money do you want to take out?"
	# 		money = gets.to_i
	# 		@wallet = player.bank_roll + money
	# 		puts "Please wait while we process your card"#sleep(4)
	# 		puts "Your transaction was successful."
	# 		puts "You now have #{@wallet}!"
	# 		menu
	# end
end

Casino.new



# start game player with name and money (class)
# menu directs player to a game (slots, high low)
# places bet and wins or loses (rand)
# player is deducted bankroll when lose and adds when wins
# ----bonus
# option to move through menu to other games
# switch players with new name and money (class)
# while moving games the money stays the same
# when you switch to other player, their money stays the same
# random events occure while switching games and win loses money
# roulette, craps, card game 
# create new game


# make a wallet and atm
>>>>>>> New casino and wallet
