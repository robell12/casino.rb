require 'pry'

class Slots
  attr_accessor :player, :casino
  def initialize(player, casino)
    @casino = casino
    @player = player
    puts """
                       |Jackpot|
           ____________|_______|____________
          |  __    __    ___  _____   __    |
          | / _\  / /   /___\/__   \ / _\   |
          | \ \  / /   //  //  / /\ \\ \  25|
          | _\ \/ /___/ \_//  / /  \/_\ \ []|
          | \__/\____/\___/   \/     \__/ []|
          |===_______===_______===_______===|
          ||*|\_     |*| _____ |*|\_     |*||
          ||*|| \ _  |*||     ||*|| \ _  |*||
          ||*| \_(_) |*||*BAR*||*| \_(_) |*||
          ||*| (_)   |*||_____||*| (_)   |*|| __
          ||*|_______|*|_______|*|_______|*||(__)
          |===_______===_______===_______===| ||
          ||*| _____ |*|\_     |*|  ___  |*|| ||
          ||*||     ||*|| \ _  |*| |_  | |*|| ||
          ||*||*BAR*||*| \_(_) |*|  / /  |*|| ||
          ||*||_____||*| (_)   |*| /_/   |*|| ||
          ||*|_______|*|_______|*|_______|*||_//
          |===_______===_______===_______===|_/
          ||*|  ___  |*|   |   |*| _____ |*||
          ||*| |_  | |*|  / \  |*||     ||*||
          ||*|  / /  |*| /_ _\ |*||*BAR*||*||
          ||*| /_/   |*|   O   |*||_____||*||
          ||*|_______|*|_______|*|_______|*||
          |lc=___________________________===|
          |  /___________________________\  |
          |   |                         |   |
         _|    \_______________________/    |_
        (_____________________________________)"""
    puts "Welcome to the Slot Machines #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
    slot_menu
  end

def slot_menu
  puts "\nSlot Machine Menu"
  puts "1) Insert Bet"
  puts "2) Pull The Lever"
  puts "3) Feelin Lucky? (Pick this option only if you dare) ;P"
  puts "4) Checkout And Return To The Casino"
  puts "Pick a menu option 1-4"
case gets.strip
  when '1'
    insert_bet
  when '2'
    pull_the_lever
  when '3'
    feeling_lucky
  when '4'
    puts "You have $#{player.bank_roll} left. Thank you for playing!"
    @casino.menu
  end
end

def insert_bet
  puts "How much do you want to bet?"
  @player_bet = gets.to_i
  if @player_bet == 0
    puts "\nYou can't spin without a bet!\n"
    slot_menu
  elsif @player_bet > player.bank_roll
    puts "Giant Black Security Guard: 'YOU'RE OUTTA HERE!'"
    puts "\nYou've been kicked out of the casino. Sucks to suck!"
    exit
  else
    puts "\nYour Bet: $#{@player_bet}"
    slot_menu
  end
end

def pull_the_lever
  slot_machine1 = ["Apple", "Orange", "Watermelon", "Pineapple"]
  slot_machine2 = ["Apple", "Orange", "Watermelon", "Pineapple"]
  slot_machine3 = ["Apple", "Orange", "Watermelon", "Pineapple"]
  shuffle_machine =[]
  puts "\nHere..We..Go!\n"
  puts "Spinning..."; sleep 0.5
  option_one = slot_machine1[rand(0..3)]
  shuffle_machine << option_one
  option_two = slot_machine2[rand(0..3)]
  shuffle_machine << option_two
  option_three = slot_machine3[rand(0..3)]
  shuffle_machine << option_three
  print "\n#{shuffle_machine[0]} "; sleep 1
  print "#{shuffle_machine[1]} "; sleep 1
  print "#{shuffle_machine[2]} "
  shuffle_machine = shuffle_machine.uniq
  shuffle_machine = shuffle_machine.count
  if shuffle_machine == 1
    jackpot
  elsif shuffle_machine == 2
    winnings
  else
    lose
  end
end

def feeling_lucky
  puts "\nLet's see how lucky you really are!\n"
  puts "The dice drops: "; sleep 2
  @lucky_roll = 1 + rand(6)
  print @lucky_roll
  if @lucky_roll % 2 == 0
    puts "\nIt's your lucky day! You just won $500!\n".colorize(:green)
    player.bank_roll = player.bank_roll + 500
    puts "You have $#{player.bank_roll} left."
    slot_menu
  else
    puts "\nSorry buddy, you just lost $100. :(\n".colorize(:red)
    player.bank_roll = player.bank_roll - 100
    puts "You have $#{player.bank_roll} left."
    slot_menu
  end
end

def jackpot
  player.bank_roll = player.bank_roll + (@player_bet * 4)
  puts "\n*JACKPOT!!*\n".colorize(:green)
  puts "\nYou won $#{@player_bet * 4}!! You have: $#{player.bank_roll}\n"
  play_again
end

def winnings
  player.bank_roll = player.bank_roll + (@player_bet * 1.5)
  puts "\nYou won $#{@player_bet * 1.5}! You have: $#{player.bank_roll}\n".colorize(:green)
  play_again
end

def lose
  player.bank_roll = player.bank_roll - (@player_bet)
  puts "\nI'm sorry, you lost! You have: $#{player.bank_roll}\n".colorize(:red)
  play_again
end

def play_again
 puts "Do you want to play again?"
 player_choice = gets.strip
 if player_choice == 'yes'
   slot_menu
 else
   puts "\nCome back soon!\n"
   slot_menu
 end
end

end
