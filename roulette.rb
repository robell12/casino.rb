class Roulette
	attr_accessor :player, :casino
	def initialize(player, casino)
		@casino = casino
		@player = player
    @roulette_color = ["RED", "BLACK"]
    puts "Welcome to Roulette #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
    roulette_menu
  end

def roulette_menu
  puts """
  EVEN           (0)(00)

  1-18        | 1  2  3  4
              | 5  6  7  8    Block 1-12
              | 9 10 11 12 _________________
  RED         | 13 14 15 16
  BLACK       | 17 18 19 20   Block 13-24
              | 21 22 23 24 ________________
              | 25 26 27 28
        (0,00)| 29 30 31 32   Block 25-36
  19-36       | 33 34 35 36 ________________
               _____________
  ODD
          col-1 | col-2 | col-3
"""
puts "ROULETTE MENU"
puts "1) Place A Bet"
puts "2) Spin The Wheel"
puts "3) Cashout And Return To Casino"
user_choice = gets.strip
case user_choice
  when '1'
    roulette_main
  when '2'
      roulette_spin
  when '3'
    cashout
  else
    puts "Please pick a valid menu option.".colorize(:yellow)
  end
end


def roulette_main
  puts "\nWhat number do you want to place your bet on? (1-36)\n"
  @number = gets.to_i
  if @number < 36
    puts "\nHow much do you want to bet?\n"
    @number_bet = gets.strip.to_i
      if @number_bet == 0
        puts "You can't play without a bet!".colorize(:yellow)
        roulette_main
      elsif @number_bet < @player.bank_roll
        puts "\nYou are betting $#{@number_bet} on the number #{@number}.\n"
        roulette_color
      else
        puts "You don't have enough money! Go to the ATM!".colorize(:yellow)
        @casino.menu
      end
  else
    puts "Please put a valid number.".colorize(:yellow)
    roulette_main
  end
end

def roulette_color
  puts "\nWhat color do you want to bet on?\n"
  puts "1) RED"
  puts "2) BLACK"
  @color = gets.strip.to_i
  case @color
  when 1,
    @roulette_color[@color - 1]
    player_color_bet
  when 2,
    @roulette_color[@color - 1]
    player_color_bet
  else
    puts "Better hurry and pick a color before it's too late!".colorize(:yellow)
    roulette_color
  end
end

def player_color_bet
  puts "What do you want to bet?"
  @color_bet = gets.to_i
  if @color_bet == 0
    puts "\nYou can't bet with no money!\n".colorize(:yellow)
    player_color_bet
  elsif @color_bet > player.bank_roll
    puts "Giant Black Security Guard: 'YOU'RE OUTTA HERE!'".colorize(:red)
    puts "\nYou've been kicked out of the casino. Sucks to suck!".colorize(:red)
    exit
  else
    puts "\nYour Bet: $#{@number_bet} on the number #{@number} and $#{@color_bet} on #{@roulette_color[@color - 1]}".colorize(:yellow)
    roulette_menu
  end
end

def roulette_spin
  puts "\nNo more bets!\n".colorize(:red)
  puts "\nYour bets: #{@number} #{@roulette_color[@color - 1]}".colorize(:yellow)
  puts "\nSpinning...";sleep 2
  @game_number = rand(1..36)
  @game_color = @roulette_color.sample
   puts "\nDealer: #{@game_number} #{@game_color}!\n".colorize(:yellow); sleep 1
   if @game_number == @number && @game_color == @roulette_color[@color - 1]
     double_win
   elsif @game_color == @roulette_color[@color - 1]
     win
   elsif @game_number == @number
     win2
   else
     lose
   end
end

def double_win
  @roulette_bet = @color_bet && @number_bet
  player.bank_roll = player.bank_roll + (@color_bet * 2) + (@number_bet * 36)
  puts "\nYou win!! You now have $#{player.bank_roll}\n".colorize(:green)
  play_again
end

def win
  @roulette_bet = @color_bet && @number_bet
  player.bank_roll = player.bank_roll + (@roulette_bet * 2)
  puts "\nYou hit #{@game_color}! You now have $#{player.bank_roll}\n".colorize(:green)
  play_again
end

def win2
  @roulette_bet = @color_bet && @number_bet
  player.bank_roll = player.bank_roll + (@roulette_bet * 36)
  puts "\nYou hit #{@game_number}! You now have $#{player.bank_roll}\n".colorize(:green)
end

def lose
  @roulette_bet = @color_bet && @number_bet
  player.bank_roll = player.bank_roll - @roulette_bet
  puts "\nYou lost. you now have $#{player.bank_roll}\n".colorize(:red)
  play_again
end

def play_again
  puts "\nWant to play again?\n"
  if gets.strip == 'yes'
    roulette_menu
  else
    puts "Thank you for playing! Come back soon!"
    @casino.menu
  end
end

def cashout
  puts "\nYou have $#{player.bank_roll} left.\n"
  puts "Hope you enjoyed your time at Roulette! Have a good day!"
  @casino.menu
end

end
