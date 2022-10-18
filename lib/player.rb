class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @life_points = 10
        @name = name
    end

    def show_state
       
        if @life_points <= 0
            return "le joueur #{name} a été tué !"
        else
            return "#{name} a #{life_points} points de vie"
        end
    end

    def gets_damage(dmg)
        @life_points = @life_points - dmg
        
        if @life_points <= 0
            return "#{name} est mort"
        else
        end
    end

    def attacks(player2)
        puts "#{@name} attaque #{player2.name}"
        dps = compute_damage
        puts "il lui inflique  #{dps} dommage "
        player2.gets_damage(dps)
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
       
        if @life_points <= 0
            @life_points = 0
            return "le joueur #{name} a été tué !"
        else
            return "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
        end
    end

    def compute_damage
        return rand(1..6) * @weapon_level.to_i
    end

    def search_weapon
        rng = rand(1..6) 
        puts "Tu as trouvé une arme de niveau #{rng}"

        if rng > @weapon_level
            @weapon_level = rng
            return  "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            return "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end

    end

    def search_health_pack

        rng = rand(1..6) 

        if rng == 0 
            puts
        elsif rng == 6
            @life_points = @life_points + 80 
            if @life_points > 100
                @life_points = 100
            end
            return "Waow, tu as trouvé un pack de +80 points de vie !. Tu a #{@life_points} life point"
        else
            @life_points = @life_points + 50 
            if @life_points > 100
                @life_points = 100
            end
            return "Bravo, tu as trouvé un pack de +50 points de vie !. Tu a #{@life_points} life point"
        end 
    end

end