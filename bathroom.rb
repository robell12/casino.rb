require 'pry'
class Bathroom
	attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		@player = player
		events = [
		"You were going to the bathroom and bumped into beautiful girl. 
		Also she is rich so in the divorce you get $6000.",
		"You found 300 dollars in the bathroom.",
		"You bumped into someone and they threatened to beat you up unless you give him $600. 
		You pay because he is a big fellow.",
		"You lost your wallet.",
		"A millionaire gives you $1000000 in the bathroom and invites you to visit him in Milan, Italy.",
		"You stumble into the wrong room and see 30 or so Asain men in a back room.
		They invite you to play. What do you say? yes/no",
		"You get lost in the casino and walk into the tiger exibit. 
		The medical bills cost $15000. It takes you 4 weeks to recover.",
		"Snoop Dog runs into you. He offers you a smoke of his good stuff. What do you say? yes/no"

		]

		thing = events.sample
		case thing
		when events[0]
			puts events[0]
			player.bank_roll = player.bank_roll + 6000
			puts "Lucky you. Now you have $#{player.bank_roll}"
			@casino.menu
		when events[1]
			puts events[1]
			player.bank_roll = player.bank_roll + 300
			puts "Not much but something. You have $#{player.bank_roll}"
			@casino.menu
		when events[2]
			puts events[2]
			player.bank_roll = player.bank_roll - 600
			puts "You avoided the hospital. You have $#{player.bank_roll}"
			@casino.menu
		when events[3]
			puts events[3]
			player.bank_roll = 0
			puts "You are broke now. That means $#{player.bank_roll}"
			@casino.menu
		when events[4]
			puts events[4]
			player.bank_roll = player.bank_roll + 1000000
			puts "Wow you are rich. You have $#{player.bank_roll}"
			@casino.menu
		when events[5]
			puts events[5]
			yep = gets.strip
			case yep
			when "yes"
			asain_game
			else
				puts "You get kicked out by guards."
				@casino.menu
			end
		when events[6]
			puts events[6]
			player.bank_roll = player.bank_roll - 15000
			@casino.menu
		when events[7]
			puts events[7]
			choose = gets.strip
			case choose
				when "yes"
				snoop_dog
			else
				puts "You missed out on a crazy night."
				@casino.menu
			end
		else
			puts "ops"
		end
	end
	def asain_game
		right = 0
		left = 1
		num = rand(2)
		puts "One man holds up 2 straws and is grabbing the ends."
		puts "They ask which one is longer? Right or left"
		straws = gets.strip.downcase
		case straws
		when "right"
			puts "You choose #{straws}"
			if num = right
				puts "You choose correctly!"
				puts "They give you $50000"
				player.bank_roll = player.bank_roll + 50000
				puts "They start to suspect you cheated."
				puts "You run away rapidly."
				@casino.menu
			else num != right
				puts "You lost and they need $50000 cash or they will break your leg!"
				if player.bank_roll < 50000
					puts "You only have #{player.bank_roll} so they take all your money and break your leg!"
					player.bank_roll = player.bank_roll - 10000
					puts "The hospital bill costs $10000, you are in a debt."
					@casino.menu
				else player.bank_roll > 50000
					puts "They take the money and kick you out"
					player.bank_roll = player.bank_roll - 50000
					@casino.menu
				end
			end
		when "left"
			puts "You choose #{straws}"
			if num = left
				puts "You guesed correctly!"
				puts "They give you $50000"
				player.bank_roll = player.bank_roll + 50000
				puts "They start to suspect you cheated."
				puts "You run away rapidly."
				@casino.menu
			else num != left
			  puts "You lost and they need $50000 cash or they will break your leg!"
				if player.bank_roll < 50000
					puts "You only have #{player.bank_roll} so they take all your money and break your leg!"
					player.bank_roll = player.bank_roll - 10000
					puts "The hospital bill costs $10000, you are in a debt."
					@casino.menu
				else player.bank_roll > 50000
					puts "They take the money and kick you out"
					player.bank_roll = player.bank_roll - 50000
					@casino.menu
				end
			end
		else
		  puts "please put right or left"
		  asain_game
		end
	end
	def snoop_dog
			puts "You partied with Snoop Dog all night and woke up in Mexico next to a goat."
			puts "You can't remember what happened but you have $20000 in your pocket."
			puts "It costs you $3000 to forge a passport and $1000 to get back to the casino."
			player.bank_roll = 16000
			@casino.menu
	end
end