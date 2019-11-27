class RandomCharacterGenerator
    
    # INCLUDE THIS WHEN WRITING ABOUT RSPEC TEST REFACTORS (i.e. not having to hard-code these into the tests)
    attr_accessor :stats_array, :points_pool, :max_roll
    def initialize
        @stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        @points_pool = 9
        @max_roll = 6
    end


    def new_character(name, player)
        character = Character.new(name: name, player: player)
        stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        points_pool = 9
        max_roll = 6
        roll_stats(character, stats_array, points_pool, max_roll)
        character.save!
        character


        # alt using .tap:
        # =====================================================
        # Character.new.tap do |character|
        #     stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        #     points_pool = 9
        #     max_roll = 6
        #     roll_stats(character, stats_array, points_pool, max_roll)
        #     save!
        # end


        # alt after refactoring variables into attributes:
        # =====================================================
        # Character.new.tap do |character|
        #     roll_stats(character, @stats_array, @points_pool, @max_roll)
        #     save!
        # end
    end


    private

    def roll_stats(character, stats_array, points_pool, max_roll)
        stats_array.each_with_index do |stat, index|
            roll = rand(1..max_roll)                                    .tap {|r| puts "roll: #{r}"}
            remaining_stats = ((stats_array.length - 1) - index)        .tap {|r| puts "remaining_stats: #{r}"}
                                                                        .tap {|r| puts "points_pool (before): #{points_pool}"}
            if remaining_stats == 0
                character[stat] = points_pool
                points_pool = 0
            elsif points_pool - roll < remaining_stats
                max_points = points_pool - remaining_stats
                character[stat] = max_points
                points_pool -= max_points
            else
                character[stat] = roll
                points_pool -= roll
            end                                                         .tap {|r| puts "character[#{stat}]: #{character[stat]}"}
                                                                        .tap {|r| puts "points_pool (after): #{points_pool}\n\n"}
        end
    end

end