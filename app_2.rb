require 'bundler'
Bundler.require

require_relative 'lib/player'

puts " ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Choisis le nom de ton personnage"
input = gets.chomp
player1 = HumanPlayer.new(input)
ennemies = [josiane = Player.new("Josiane"), josé = Player.new("José")]

puts "Salut #{player1.name}"

while player1.life_points >0 && (josiane.life_points > 0 || josé.life_points >0)
    puts "__________________________________________________________"
    puts "Tu a #{player1.life_points}HP et une arme lvl #{player1.weapon_level}"
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts ""
    puts "attaquer un joueur en vue :"
    if josiane.life_points < 0 
        puts josiane.name + " est mort"
    else
        puts "0 - Josiane a #{josiane.life_points} points de vie"
    end

    if josé.life_points < 0 
        puts josé.name + " est mort"
    else
        puts "1 - José a #{josé.life_points} points de vie"
    end
    puts "__________________________________________________________"
    choise = gets.chomp
    puts ""
    puts ""

    if choise == "a"
        puts player1.search_weapon
    elsif choise == "s"
        puts player1.search_health_pack    
    elsif choise === "0"
        puts player1.attacks(josiane)
    elsif choise === "1"
        puts player1.attacks(josé)
    end
    puts ""

    if josiane.life_points > 0 || josé.life_points > 0
        puts "Les autres joueurs t'attaquent !"
    end

    ennemies.each do |i|
        if i.life_points <= 0 && player1.life_points > 0
        else
            puts i.attacks(player1)
        end
    end

end
puts ""

puts  "La partie est finie"

if player1.life_points >0 
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end

