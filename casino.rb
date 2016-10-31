require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'highlow'

class Casino
	attr_accessor :player
  def initialize
    puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
    menu
  end

  def menu
  	#pass player instance into each game
  	#to class needed acces to player
  	puts "You have some options---"
  	puts "See bankroll"
  	puts ""
  	Highlow.new(player)
  end
end

Casino.new

# start game player with name and money (class)
# menu directs player to a game (slots, high low)
# places bet and wins or loses (rand)
# player is deducted bankroll when lose and adds when wins
# ----bonus
# option to move through menu to other games
# switch players with new name and money (class)
# while moving games the money stays the same
# when you switch to other player, their money stays the same
# random events occure while switching games and win loses money
# roulette, craps, card game 
# create new game
