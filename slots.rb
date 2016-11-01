require 'pry'

class Slots
  attr_accessor :player, :casino
  def initialize(player, casino)
    @casino = casino
    @player = player
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
    puts "How much do you want to bet?"
  when '2'
    puts "Here..We..Go!"
  when '3'
    puts "Let's see how lucky you really are!"
    @lucky_roll = 1 + rand(6)
    puts @lucky_roll
    if @lucky_roll % 2 == 0
      puts "It's your lucky day! You just won $500!"
    else
      puts "Sorry buddy, you just lost $100. :("
    end
  when '4'
    puts "You have $#{player.bank_roll} left. Thank you for playing!"
    @casino.menu
  end
end
























end
