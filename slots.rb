class Slots
  attr_accessor :player, :casino
  def initialize(player, casino)
    @casino = casino
    puts "Welcome to the Slot Machines #{player.name}!".colorize(:light_blue)
    puts "\nYou have $#{player.bank_roll} dollars to play with.\n"
  end



























end
