require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

josiane = Player.new("Josiane")
josé = Player.new("José")

puts "Voici l'état de chaque joueur :"
puts josiane.show_state
puts josé.show_state
puts "----------------------"



puts "Passons à la phase d'attaque :"

while josiane.life_points > 0 && josé.life_points > 0
    josiane.attacks(josé)

    if josé.life_points <= 0
        break
    end

    josé.attacks(josiane)

    if josiane.life_points <= 0
        break
    end

    puts "Voici l'état de chaque joueur :"
    puts josiane.show_state
    puts josé.show_state
    puts "----------------------"
  
end

puts josiane.show_state
puts josé.show_state

