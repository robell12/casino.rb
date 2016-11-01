@roulette_numbers = [1..36]
@first_block = [1..12]
@second_block = [13..24]
@third_block = [25..36]
@first_half = [1..18]
@second_half = [19..36]
@roulette_even = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36]
@roulette_odd = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35]
@roulette_col_1 = [1,5,9,13,17,21,25,29,33]
@roulette_col_2 = [2,6,10,14,18,22,26,30,34]
@roulette_col_3 = [4,8,12,16,20,24,28,32,36]
@roulette_red = ["red"]
@roulette_black = ["black"]
@roulette_green = ["(0)","(00)"]
@roulette_green_half = ["(0,00)"]

class Roulette
	attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		@player = player
    puts "Welcome to Roulette #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
    roulette_main
  end

def roulette_main
  puts """
  EVEN           (0)(00)

  1-18        | 1  2  3  4
              | 5  6  7  8    1-12
              | 9 10 11 12 _____________
  RED         | 13 14 15 16
  BLACK       | 17 18 19 20   13-24
              | 21 22 23 24 ____________
              | 25 26 27 28
        (0,00)| 29 30 31 32   25-36
  19-36       | 33 34 35 36 ____________
               _____________
  ODD
          col-1 | col-2 | col-3
"""
  puts "How much do you want to bet?"
  @player_bet = gets.to_i
  if @player_bet == 0
    puts "\nYou can't play without a bet!\n"
    roulette_main
  elsif @player_bet > player.bank_roll
    puts "Giant Black Security Guard: 'YOU'RE OUTTA HERE!'"
    puts "\nYou've been kicked out of the casino. Sucks to suck!"
    exit
  else
    puts "\nYour Bet: $#{@player_bet}"
    player_location
  end
end

def player_location
    puts "\nWhere do you want to place your bet?\n"
    @player_location = gets.strip.downcase
    @player_location = @player_location.split
  end
end
