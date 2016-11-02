
class Card
	attr_accessor :rank, :suit, :color, :value
	def initialize(rank, suit, color, value)
		@rank = rank
		@value = value
		@suit = suit
		@color = color
	end
end