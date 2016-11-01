class Bathroom
	attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		events = [
		"You were going to the bathroom and bumped into beautiful girl. 
		Also she is rich so in the divorce you get $6000.",
		"You found 300 dollars in the bathroom.",
		"You bumped into someone and they threatened to beat you up unless you give him $600. 
		You pay because he is a big fellow.",
		"You lost your wallet.",
		"A millionaire gives you $1000000."
		]

		thing = events.sample
		case thing
		when events[0]
			puts events[0]
			player.bank_roll = player.bank_roll + 6000
			puts "Lucky you. Now you have $#{player.bank_roll}"
		when events[1]
			puts events[1]
			player.bank_roll = player.bank_roll + 300
			puts "Not much but something. You have $#{player.bank_roll}"
		when events[2]
			puts events[2]
			player.bank_roll = player.bank_roll - 600
			puts "You avoided the hospital. You have $#{player.bank_roll}"
		when events[3]
			puts events[3]
			player.bank_roll = 0
			puts "You are broke now. That means $#{player.bank_roll}"
		when events[4]
			puts events[4]
			player.bank_roll = player.bank_roll + 1000000
			puts "Wow you are rich. You have $#{player.bank_roll}"
		else
			puts "ops"
		end
		@casino.menu
	end
end