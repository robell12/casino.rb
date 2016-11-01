require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'highlow'
require_relative 'roulette'
require_relative 'wallet'
require_relative 'slots'
require_relative 'bathroom'
require_relative 'blackjack'


class Casino
	attr_accessor :player, :bank_roll, :cards
  def initialize
		@player_arr = []
  	puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
		@player_arr << @player
    menu
  end

  def menu
		puts "\nWhat would you like to play?"
  	puts "----Games---".colorize(:light_blue)
  	choice_1 = "\nHighlow\nBlackjack\nSlots\nRoulette\nGo To Bathroom\nUse ATM\nView Players\nExit Casino\n "
    puts choice_1
  	puts "Please Select One"
  	choice = gets.strip.downcase
  	case choice
      when "highlow"
  			Highlow.new(@player, self)
  		when "blackjack"
  			Blackjack.new(@player, self)
      when "slots"
        Slots.new(@player, self)
			when "roulette"
				Roulette.new(@player, self)
  		when "go", "to", "bathroom", "go to bathroom"
  			Bathroom.new(@player, self)
      when "view", "players", "view players"
        player_menu
      when "use", "atm", "use atm"
      	atm
  		when "exit", "casino"
        puts "Thank you for visiting the RUBY CASINO! Come back soon!"
  			exit
  		else
  			puts "Please select from the choices above."
  			menu
		end
  end

	def player_menu
		puts "\nWould you like to view your players or add a new one?"
		puts "1) View Players"
		puts "2) Add A Player"
		puts "3) Return to Casino"
		user_choice = gets.strip
		case user_choice
			when '1'
				player_profile
			when '2'
				if @player_arr.count < 3
					@player = Player.new
					@player_arr << @player
				else
					puts "Sorry! Only 3 players allowed!"
				end
				player_menu
				when '3'
					menu
			end
		end

	def player_profile
		@player_arr.each_with_index { |x, i| puts "#{i + 1}. #{x.name.capitalize} $#{x.bank_roll}" }
		puts "Which player would you like to play as?"
		player_switch = gets.strip
		case player_switch
			when '1'
				@player = @player_arr[0]
			when '2'
				@player = @player_arr[1]
			when '3'
				@player = @player_arr[2]
			else
				puts "Player does not exist."
			end
			puts "You are now #{player.name.capitalize}!"
			player_menu
	end

  def atm
			puts "How much money do you want to take out?"
			money = gets.to_i
			if money > 500
				puts "You can only take out $500 at a time. Please try again!"
				atm
			end
			player.bank_roll = player.bank_roll + money
			puts "Please wait while we process your card..."
			puts "Your transaction was successful."
			puts "You now have $#{player.bank_roll}!"
			menu
	end
end

Casino.new
