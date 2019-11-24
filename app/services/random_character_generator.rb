class RandomCharacterGenerator
    def initialize
    end

    def new_character(name)
        character = Character.new(name: name)
        points_pool = 20

        roll_stat(character, "strength", points_pool)
        roll_stat(character, "dexterity", points_pool)
        roll_stat(character, "intelligence", points_pool)
        roll_stat(character, "charisma", points_pool)
        # check for leftover points in points_pool

        character


        # alt using .tap:
        # =====================================================
        # Character.new.tap do |character|
        #     points_pool = 20
        #     roll_stat(character, "strength", points_pool)
        #     roll_stat(character, "dexterity", points_pool)
        #     roll_stat(character, "intelligence", points_pool)
        #     roll_stat(character, "charisma", points_pool)
        # end
    end

    def roll_stat(character, stat, points_pool)
        roll = rand(1..6)
        # check if points_pool will be 0 or less here??
        character[stat] = roll
        points_pool -= roll
    end

    def allocate_extra_points(character, points_pool)
        # allocate extra points to highest stat?
    end

end