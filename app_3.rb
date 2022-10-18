require 'bundler'
Bundler.require

require_relative 'lib/game_3'
require_relative 'lib/player'

puts " ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Choisis le nom de ton personnage"
input = gets.chomp
my_game = Game_3.new(input)

my_game.play



