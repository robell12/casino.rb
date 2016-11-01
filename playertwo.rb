class PlayerTwo
	attr_accessor :name, :bank_roll

	def initialize(casino)
    @casino = casino
    puts "What is your name?"
    @name = gets.strip
    puts "How much money are you willing to lose?"
    @bank_roll = gets.to_i + 1000
    puts "Since this is your first time we gave you $1000 more."
    puts "You now have $#{@bank_roll}!"
    @casino.menu
	end
end
