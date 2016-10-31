require 'pry'
require 'colorize'

class Casino
  def initialize
    puts "Welcome to the RUBY CASINO!".colorize(:light_blue)
    @player = Player.new
    menu
  end

  def menu
  end
end

Casino.new
