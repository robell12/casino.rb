# class Card
# 	attr_accessor :rank, :suit, :color
# 	def initialize(rank, suit, color)
# 		@rank = rank
# 		@suit = suit
# 		@color = color
# 	end
# end

# class Deck
# 	attr_accessor :cards
# 	def initialize
# 		@ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
# 		@suit = ["Spades", "Diamonds", "Clubs", "Hearts"]
# 		@cards = []
# 		generate_deck
# 	end

# 	def generate_deck
# 		@suits.each.sample do |suit|
# 			@ranks.size.times do |i|
# 				color = (i % 2 == 0) ? 'Black' : 'Red'
# 				@cards << Card.new(@ranks[i], suit, color)
# 			end
# 		end
# 	end
# end

# d = Deck.new
# puts d.cards