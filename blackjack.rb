

require 'pry'
require_relative 'card'



class Deck
	attr_accessor :cards, :player
	@arr = []
	def initialize (player, cards)
		@rank = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
		@value = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
		@suit = ["Spades", "Diamonds", "Clubs", "Hearts"]
		@cards = []
		generate_deck
	end

	def generate_deck
		@suit.each do |suit|
			@rank.size.times do |i|
				@value = @value [i]
				@color = (i % 2 == 0) ? 'Black' : 'Red'
				@cards << Card.new(@rank[i], @suit, @color, @value)

			end
		end

	@dealer_card1 = @cards.sample
	@dealer_card2 = @cards.sample
	@dealer_total = @dealer_card1.value + @dealer_card2.value
	@player_card1 = @cards.sample
	@player_card2 = @cards.sample
	@player_total = @player_card1.value + @player_card2.value
  blackjack

	end

	def blackjack
		puts "How much do you want to bet."
		moneys = gets.strip.to_i
		puts "The dealer has #{@dealer_card1.rank} of #{@dealer_card1.suit.sample}
		#{@dealer_card2.rank} of #{@dealer_card2.suit.sample}"
		puts "The dealer has #{@deal_total} in his hand right now."
		puts "Your cards are #{@player_card1.rank} of #{@player_card1.suit.sample} and 
    #{@player_card2.rank} of#{@player_card2.suit.sample}"
    puts "You have #{@player_total} in your hand right."
    puts "Do you want to hit or stay? h/s"
    choose = gets.strip
    case choose
    when "h"
    	hit
    else
    	calculate
    end
	end

	def hit
		@player_card3= @cards.sample
		@player_total = @player_total + @player_card3.value
		if @player_total > 21
			puts "Your cards are #{@player_card1.rank} of #{@player_card1.suit.sample} and 
    #{@player_card2.rank} of#{@player_card2.suit.sample}
    and #{@player_card3.rank} of #{@player_card3.suit.sample}"
    puts "You have #{@player_total} in your hand right."
			puts "You bust"
			player.bank_roll = player.bank_roll - moneys
			@casino.menu
		else
			puts "Your cards are #{@player_card1.rank} of #{@player_card1.suit.sample} and 
    #{@player_card2.rank} of#{@player_card2.suit.sample}
    and #{@player_card3.rank} of #{@player_card.suit.sample}"
    puts "You have #{@player_total} in your hand right."
    calculate
  	end
	end

	def calculate
		if @player_total < @dealer_total
			puts "You lose"
			player.bank_roll = player.bank_roll - moneys
			@casino.menu
		elsif @player_total > @deal_total
			puts "You win"
			player.bank_roll = player.bank_roll + moneys
			@casino.menu
		else @player_total = @dealer_total
			puts "Its a tie"
			@casino.menus
		end
	end
end

