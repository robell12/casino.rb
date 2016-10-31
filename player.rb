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
    @bank_roll = 100
	end
end