class Highlow
	attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		@player = player
		puts """
 ____    ____    ____    ____
|A   |  |K   |  |Q   |  |J   |
|(\\/)|  | /\\ |  | /\\ |  | &  |
| \\/ |  | \\/ |  |(__)|  |&|& |
|   A|  |   K|  | /\\Q|  | | J|
`----`  `----'  `----'  `----'"""
		puts "Welcome to High-Low #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
		highlow_welcome
	end

	def highlow_welcome
		puts "How much do you want to bet?"
		@player_bet = gets.to_i
		if @player_bet == 0
			puts "You have to make a bet if you want to play!"
			highlow_welcome
		elsif @player_bet > player.bank_roll
			puts "\nGiant Black Security Guard: 'YOU'RE OUTTA HERE!'\n"
			puts "You've been kicked out of the casino. Sucks to suck!"
			exit
		else
			puts "Ok, your bet is for $#{@player_bet}. Are you ready to play?"
			if gets.strip == 'yes'
				play_game
			else
				puts "Come back when you're ready to play!"
				highlow_menu
			end
		end
	end

	def highlow_menu
		puts "High-Low Menu".colorize(:light_blue)
		puts "1) Play Game"
		puts "2) Learn Rules"
		puts "3) Return to Casino"
		case gets.strip
		when '1'
			highlow_welcome
		when '2'
			highlow_rules
		when '3'
			@casino.menu
		else
			puts "Please pick a valid menu option."
		end
	end


	def play_game
		@dealer_card = rand(1..14)
		@player_card = rand(1..14)
		puts "\nDealer flips a #{@dealer_card}.\n"
		puts "You flip a #{@player_card}."
		if @dealer_card > @player_card
			puts "\nSorry, Dealer wins!\n".colorize(:red)
		  lose
			play_again
		elsif @dealer_card == @player_card
			puts "\nIt's a push!\n".colorize(:yellow)
			play_again
		else
			puts "\nCongrats! You win!\n".colorize(:green)
			win
			play_again
		end
	end

	def play_again
		puts "Want to play again?"
		if gets.strip == 'yes'
			another_bet
		else
			puts "Thank you for playing! Come back soon!"
			highlow_menu
		end
	end

	def another_bet
		puts "What is your bet?"
		@player_bet = gets.to_i
		if @player_bet == 0
			puts "You have to make a bet if you want to play!"
			another_bet
		elsif @player_bet > player.bank_roll
			puts "Giant Black Security Guard: 'YOU'RE OUTTA HERE!'"
			puts "\nYou've been kicked out of the casino. Goodbye!"
			exit
		else
		end
		puts "Your new bet is $#{@player_bet}. Let's go!"
		play_game
	end

	def highlow_rules
		puts "\nRules of High-Low\n"
		puts "1) Player places a bet of his/her choosing."
		puts "2) Dealer pulls one card at random from the deck."
		puts "3) Dealer pulls another card at random from the deck for the player."
		puts "4) Whoever has the higher card wins."
		puts "5) It's as simple as that!"
		puts "6) Push '6' to return to the menu"
		if gets.strip == '6'
			highlow_menu
		end
	end

	def lose
		player.bank_roll = player.bank_roll - @player_bet
		puts "You have #{player.bank_roll}"
		play_again
	end

	def win
		player.bank_roll = player.bank_roll + (@player_bet * 2)
		puts "You have #{player.bank_roll}"
		play_again
	end
end
