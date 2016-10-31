require 'pry'


class Highlow
	def initialize(player)
		puts "Welcome to High-Low #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
		highlow_welcome
	end

	def highlow_welcome
		puts "How much do you want to bet?"
		@player_bet = gets.to_i
		puts "Ok, your bet is for $#{@player_bet}. Are you ready?"
		if gets.strip == 'yes'
			play_game
		else
			puts "Come back when you're ready to play!"
			highlow_menu
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
			@casino.new
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
			play_again
		elsif @dealer_card == @player_card
			puts "\nIt's a push!\n".colorize(:yellow)
			play_again
		else
			puts "\nCongrats! You win!\n".colorize(:green)
			play_again
		end
	end

	def play_again
		puts "Want to play again?"
		if gets.strip == 'yes'
			another_bet
		else
			puts "Thank you for playing! Come back soon!"
			puts
			highlow_menu
		end
	end

	def another_bet
		puts "What is your bet?"
		@new_bet = gets.to_i
		if @new_bet == 0
			puts "You need to make a bet."
			another_bet
		end
		puts "Your new bet is $#{@new_bet}. Let's go!"
		play_game
	end

end
