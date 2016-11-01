
# require 'pry'


# class Card
# 	attr_accessor :rank, :suit, :color
# 	def initialize(rank, suit, color)
# 		@rank = rank
# 		@suit = suit
# 		@color = color
# 	end
# end

# class Deck
# 	attr_accessor :cards, :rank, :suit
# 	def initialize
# 		@rank = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
# 		@suit = ["Spades", "Diamonds", "Clubs", "Hearts"]
# 		@cards = []
# 		generate_deck
# 	end

# 	def generate_deck
# 		@suit.each do |suit|
# 			@rank.size.times do |i|
# 				color = (i % 2 == 0) ? 'Black' : 'Red'
# 				@cards << Card.new(@rank[i], suit, color)
					
# 			end
# 		end
# 	puts "#{@cards}"
# 	dealer_card = @cards
# 	puts "#{dealer_card}"
# 	binding.pry
	
# 	# 	puts "How much money do you want to bet?"
# 	# 	moneys = gets.strip.to_i
# 	# 	puts "Okay you bet #{moneys}. Lets go!"
# 	# 	card_new = @cards.sample
# 	# 	card_another = @cards.sample
# 	# 	puts "Your cards are #{card_new} and #{card_new}"

# 	end
# end



# class Blackjack
# 	attr_accessor :cards, :rank, :suit
# 	def initialize
# 		puts "How much money do you want to bet?"
# 		moneys = gets.strip.to_i
# 		puts "Okay you bet #{moneys}. Lets go!"
# 		object1 = Deck.new
# 		object1.generate_deck

# 		# puts "#{@cards}"
# 		# binding.pry


# 		# r = @d.cards.sample 

# 		# puts "#{r.rank} of #{r.suit}"
# 	end
# end

# d.cards.each do |c| 
	# puts "#{c.rank} #{.suit}"
# 	new_card = c.rank.sample
# 	puts "#{new_card}"
# end
# d.cards.each do |c|
# 	@card_new = c.rank
# 	@card_another = c.rank.sample
# 	puts "The dealer has #{@card_new} #{c.suit} and #{@card_another} #{c.suit}"
# # class Blackjack
# end
# class Blackjack
# 	def initialize
# 		puts "How much money do you want to bet?"
# 		@moneys = gets.strip.to_i
# 		puts "Okay you bet #{@moneys}. Lets go!"
# 			binding.pry
# 		dealer
# 	end

# 	def dealer
# 		r = @d.cards.sample 
# 		puts "#{r.suit} #{r.rank}"

# 		# @d.cards.each do |c|
# 		# 	card_new = c.rank
# 		# 	card_another = c.rank
# 		# end
# 		# puts "The dealer has #{card_new} #{c.suit} and #{card_another} #{card.suit}"
# 	end
# end







# Suits = ["Clubs","Hearts","Spades","Diamonds"]
# Ranks = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
# $d = []

# class Card
#   include Enumerable 
#     # class variables (private)
#     @@suit_value = Hash[ Suits.each_with_index.to_a ]
#     @@rank_value = Hash[ Ranks.each_with_index.to_a ]
 
#     attr_reader :rank, :suit
#     attr_accessor :value
 
#     def initialize(rank, suit)
#         @rank = rank
#         @suit = suit
#     end

#     def value 
#       value = case @rank.to_i
#         when 1
#           11
#         when 2..10
#           @rank
#         when 11..13
#           10
#         else
#           nil
#       end
#     end

#     def display_rank
#       case @rank
#         when "11"
#           "Jack"
#         when "12"
#           "Queen"
#         when "13"
#           "King"
#         when "1"
#           "Ace"
#         else
#           @rank
#         end
#     end

#     def to_s
#       "#{display_rank} of #{@suit}, value #{value}"
#     end
# end

# # the below is my test
# # card = Card.new(12,"Spades")
# # puts card.to_s

# class Deck
#   attr_accessor :cards
#   def initialize
#     @cards = []
#     Suits.each do |suit|
#       Ranks.each do |rank| 
#         @cards << Card.new(rank, suit)
#       end
#     end
#   end
#   def shuffle!
#     @cards.shuffle!
#   end
#   def draw
#     @cards.pop
#   end
#   def remaining
#     @cards.length
#   end
# end

# # d.cards.each do |card|
# #   puts card.to_s
# # end

# class Player
#   attr_accessor :hand, :hand_value, :ace_count
#   def initialize
#       @hand = []
#       @hand_value = 0
#       @ace_count = ace_count
#       2.times do
#         card = $d.draw
#         @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
#         @hand << card
#       end
#   end

#   def hit
#     card = $d.draw
#     @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
#     @hand << card
#   end

#   def switch_ace
#     while @hand_value > 21 && @ace_count > 0
#       @ace_count -= 1
#       @hand_value -= 10
#     end
#   end

#   def to_s
#     puts "#{@hand.to_s}, total value #{@hand_value}"
#   end
# end

# $d = Deck.new
# $d.shuffle!
# puts "A new deck has been shuffled and there are #{$d.remaining} cards"

# playah = Player.new
# puts "Player's hand:"
# puts playah.to_s
# dealah = Player.new

# if playah.hand_value == 21
#   puts "Player wins with BlackJack!"
#   puts "Dealer's hand:"
#   puts dealah.to_s    
# else
#   until playah.hand_value > 21 
#     playah.switch_ace
#     puts "Do you want to hit(h) or stay(s)?"
#     action = $stdin.gets.chomp
#     if action == "h" 
#       puts "You chose to hit, here's your new hand"
#       playah.hit
#       puts playah.to_s
#     else
#       puts "You chose to stay, here's your final hand"
#       puts playah.to_s
#       break
#     end
#   end

#   puts "Dealer's hand:"
#   puts dealah.to_s

#   if playah.hand_value <= 21
#     if playah.hand_value > dealah.hand_value
#       puts "Player wins"
#     elsif playah.hand_value == dealah.hand_value
#       puts "Dealer and Player tied"
#     else
#       puts "Dealer wins"
#     end
#   else
#     puts "Player busts. Dealer wins"
#   end
# end

# puts "There are #{$d.remaining} cards in the deck"






# class Blackjack
# 	attr_accessor :rank, :player, :casino
# 	def initialize(player, casino)
# 		@player = player
# 		@casino = casino
# 		@rank = [2,3,4,5,6,7,8,9,10,11]
# 		puts "How much do you want to bet?"
# 		@moneys = gets.strip.to_i
# 		random
# 	end
		
#   def random
# 		@card_p1 = @rank.sample
# 		@card_p2 = @rank.sample
# 		@card_d1 = @rank.sample
# 		@card_d2 = @rank.sample
# 		@player_total = @card_p1 + @card_p2
# 		@dealer_total = @card_d1 + @card_d2
# 		puts "You have #{@card_p1} + #{@card_p2} = #{@player_total}"

# 		puts "The dealer has #{@card_d1} + #{@card_d2} = #{@dealer_total}"

# 		puts "Do you want another card? yes/no"
# 		@choice = gets.strip
# 		choice
#   end

# 	def choice
# 		case @choice
# 		when "yes"
# 			@card_p3 = @rank.sample
# 			@player_total = @player_total + @card_p3
# 			puts "You have #{@card_p1} #{@card_p2} and #{@card_p3}."
# 			if @player_total > 21
# 				"You busted. You lost $#{@moneys}"
# 				player.bank_roll = player.bank_roll - @moneys
# 				puts "You have #{player.bank_roll}"
# 				menu
# 			else
# 				"Do you want another card?"
# 				another = gets.strip
# 				if another == "yes"
# 					another_card
# 				else
# 					calculation
# 				end
# 			end
# 		else
# 			calculation
# 		end
# 	end
# 	def another_card
# 		@card_p4 = @rank.sample
# 		@player_total = @player_total + @card_p4
# 		puts "You have #{@card_p1} #{@card_p2} and #{@card_p3} #{@card_p4}."
# 		if @player_total < 21
# 			"You busted. You lost $#{@moneys}"
# 			player.bank_roll = player.bank_roll - @moneys
# 			menu
# 		else
# 			calculation
# 		end
# 	end
# 	def calculation
# 		if player_total < dealer_total
# 			puts "You lost to the dealer"
# 			player.bank_roll = player.bank_roll - @moneys
# 			menu
# 		elsif player_total > dealer_total
# 			puts "Congrats, you won $#{@moneys}"
# 			player.bank_roll = player_bank_roll + @moneys
# 			puts "Now you have $#{player.bank_roll}"
# 			menu
# 		else player_total =  dealer_total
# 			puts "You tied! No money won."
# 			menu
# 		end
# 	end
# 	def menu
# 		puts "Do you want to play again"
# 		again = gets.strip
# 		if "yes"
# 			random
# 		else
# 			@casino.menu
# 		end
# 	end
# end