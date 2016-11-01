class Card
	attr_accessor :rank, :suit, :color
	def initialize(rank, suit, color)
		@rank = rank
		@suit = suit
		@color = color
	end
end

class Deck
	attr_accessor :cards, :rank, :suit
	def initialize
		@rank = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
		@suit = ["Spades", "Diamonds", "Clubs", "Hearts"]
		@cards = []
		generate_deck
	end

	def generate_deck
		@suit.each do |suit|
			@rank.size.times do |i|
				color = (i % 2 == 0) ? 'Black' : 'Red'
				@cards << Card.new(@rank[i], suit, color)
			end
		end
	end
end

d = Deck.new
d.cards.each do |c| 
	puts "#{c.rank} #{c.suit}"
end