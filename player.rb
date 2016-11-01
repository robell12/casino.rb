class Player
	attr_accessor :name, :bank_roll

	def initialize
    puts "What is your name?"
    @name = gets.strip
    puts "How much money are you willing to lose?"
    @bank_roll = gets.to_i + 1000
    puts "\nSince this is your first time we gave you $1000 more.\n"
    puts "You now have $#{@bank_roll}!"

	end
end
