class Game_3
    attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight

    def initialize(name)
        @players_left = 10
        @enemies_in_sight = []
        @enemies = []
        @human_player = HumanPlayer.new(name)
        5.times do |i|
            @enemies << Player.new("ennemie #{i + 1}")
        end
    end

    def kill_player
        @enemies_in_sight.each do |k|
            if k.life_points <= 0
            @enemies_in_sight.delete(k)
            end
        end
    end

    def is_still_ongoing?
        if  @human_player.life_points < 0 ||  @enemies_in_sight.empty?
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
        puts ">>#{@human_player.name} Le tueur. Tu a #{@human_player.life_points}HP et une arme lvl #{@human_player.weapon_level}"
        puts "il reste #{@players_left + @enemies_in_sight.length} ennemie a batres"
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner" 
        puts ""
        puts "attaquer un joueur en vue :"
        j = 0
        @enemies_in_sight.each do |i|
            j = j + 1
          puts  "#{j} - #{i.name}  a #{i.life_points} points de vie"
        end
        return ""
    end

    def menu_choice 
        choise = gets.chomp
        puts "
                 ________________
        O|===|* >________________>"
        puts ""
        if choise == "a"
            puts @human_player.search_weapon
        elsif choise == "s"
            puts @human_player.search_health_pack    
        else
            puts @human_player.attacks(@enemies_in_sight[choise.to_i - 1])
        end

        kill_player

        return

    end

    def enemies_attack 

        @enemies_in_sight.each do |i|
            if i.life_points <= 0 || @human_player.life_points < 0
                break
            else
                puts "----->"
                puts i.attacks(@human_player)
            end
        end
       
    end 

    def ending 
        if @human_player.life_points > 0 
            puts ""
            puts ""
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts ""
            puts ""
            puts "Loser ! Tu as perdu !"
        end
        
    end

    def new_players_in_sight
        puts "__________________________________________________________"
        puts ""
        roll = rand(1..6)
        if  @enemies_in_sight.length < 5 && @players_left > 0
            if roll == 6
                @players_left = @players_left - 2
                @enemies_in_sight << Player.new("ennemie #{rand(1..1000)}")
                @enemies_in_sight << Player.new("ennemie #{rand(1..1000)}")
                puts "+ 2 ennemie dans la pool"
            elsif roll == 1
                puts "pas de nouvelle ennemis "
            else
                @players_left = @players_left - 1
                @enemies_in_sight << Player.new("ennemie #{rand(1..1000)}")
                puts "+ 1 ennemie dans la pool"
            end
        end

    end

    def play
        while @human_player.life_points > 0 &&  (@players_left > 0 || @enemies_in_sight.length > 0 )
            new_players_in_sight
            menu 
            menu_choice 
            enemies_attack 
        end
        ending
    end

end