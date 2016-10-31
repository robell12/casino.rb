require 'pry'
require_relative 'player'


class Wallet
		# attr_accessor :wallet, :cards, :player, :bank_roll
	# def initialize(player)
	# 	puts "You have $#{player.bank_roll} in your hand."
	# 	puts "Do you want to put it in your wallet? yes/no"
	# 	money = gets.strip
	# 	case money
	# 	when "yes"
	# 		@wallet = @bank_roll
	# 	  puts "Do you have credit cards? yes/no"
	# 	  choose = gets.strip
	#       case choose
	#     	when "yes"
	#     		puts "How many cards do you have?"
	#     		@cards = gets.to_i
	#     		puts "You have #{cards} credit cards"
	#     	else
	#     		puts "No ATM for you"
	#     		binding.pry
	#     		@menu
	#     	end
	# 	else
	# 		puts "You might get robbed!"
	# 		# Casino(menu)
	# 	end
	# end

  attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		puts "You have $#{player.bank_roll} in your hand."
		puts "Do you want to put it in your wallet? yes/no"
		money = gets.strip
		case money
		when "yes"
			@wallet = @bank_roll
		  puts "Do you have credit cards? yes/no"
		  choose = gets.strip
	      case choose
		   	when "yes"
		   		puts "How many cards do you have?"
		   		@cards = gets.to_i
		    	puts "You have #{@cards} credit cards"
		    else
		    	puts "No ATM for you"
		    	
		    	@casino.menu
		    end
		else
			puts "You might get robbed!"
			@casino.menu
		end
	end

	def atm
			puts "How much money do you want to take out?"
			money = gets.to_i
			@wallet = player.bank_roll + money
			puts "Please wait while we process your card"#sleep(4)
			puts "Your transaction was successful."
			puts "You now have #{@wallet}!"
			menu
	end
end	