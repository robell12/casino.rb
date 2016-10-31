class Player
	attr_accessor :name, :bank_roll

	def initialize
    puts "What is your name?"
    @name = gets.strip
    #todo: error checking for valid name
    # figure out bank_roll, random, askuser, hardcoded value
    # want bankroll to be float
    #player to have wallet
    # when player gets created gets new wallet
<<<<<<< 0b1c5dccf3796d70517763803849a412f4dbb846
		puts "How much money are you willing to lose?"
    @bank_roll = gets.to_i + 1000
		puts "Since this is your first time we gave you $1000"
		puts "You now have $#{bank_roll}!"
=======
    puts "How much money are you willing to lose?"
    @bank_roll = gets.to_i + 1000
    puts "Since this is your first time we gave you $1000 more."
    puts "You now have $#{@bank_roll}!"
>>>>>>> New casino and wallet
	end
end
