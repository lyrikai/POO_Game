class Game
    attr_accessor :human_player, :enemies 

    def initialize(name)

        @enemies = []
        @human_player = HumanPlayer.new(name)
        5.times do |i|
            @enemies << Player.new("ennemie #{i + 1}")
        end
    end

    def kill_player
        @enemies.each do |k|
            if k.life_points < 0
            @enemies.delete(k)
            end
        end
    end

    def is_still_ongoing?
        if  @human_player.life_points < 0 ||  @enemies.empty?
            return false
        else
            return true
        end
    end

    def show_players
        puts "#{@human_player.name} a #{@human_player.life_points} points de vie et une arme de niveau #{@human_player.weapon_level}"
        puts "Il reste #{@enemies.length} ennemies"
    end

    def menu 
        puts "__________________________________________________________"
        puts "#{@human_player.name}Tu a #{@human_player.life_points}HP et une arme lvl #{@human_player.weapon_level}"
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner" 
        puts ""
        puts "attaquer un joueur en vue :"
        j = 0
        @enemies.each do |i|
            j = j + 1
          puts  "#{j} - #{i.name}  a #{i.life_points} points de vie"
        end
        return ""
    end

    def menu_choice 
        choise = gets.chomp
        puts ""
        puts ""

        if choise == "a"
            puts @human_player.search_weapon
        elsif choise == "s"
            puts @human_player.search_health_pack    
        else
            puts @human_player.attacks(@enemies[choise.to_i - 1])
        end

        kill_player

        return

    end

    def enemies_attack 

        @enemies.each do |i|
            if i.life_points <= 0 || @human_player.life_points < 0
                
            else
                puts i.attacks(@human_player)
            end
        end
       
    end 

    def ending 
        if @human_player.life_points > 0 
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts "Loser ! Tu as perdu !"
        end
        
    end

    def play
        while @human_player.life_points > 0 && @enemies.length > 0
            menu 
            menu_choice 
            enemies_attack 
        end
        ending
    end

end