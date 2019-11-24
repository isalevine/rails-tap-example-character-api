# BEFORE:
# ==============================================================

# class RandomCharacterGenerator
#     def initialize
#     end

#     def new_character(name)
#         character = Character.new(name: name)
#         points_pool = 9

#         roll_stat(character, "strength", points_pool)
#         roll_stat(character, "dexterity", points_pool)
#         roll_stat(character, "intelligence", points_pool)
#         roll_stat(character, "charisma", points_pool)
#         # check for leftover points in points_pool

#         character


#         # alt using .tap:
#         # =====================================================
#         # Character.new.tap do |character|
#         #     points_pool = 9
#         #     roll_stat(character, "strength", points_pool)
#         #     roll_stat(character, "dexterity", points_pool)
#         #     roll_stat(character, "intelligence", points_pool)
#         #     roll_stat(character, "charisma", points_pool)
#         # end
#     end

#     def roll_stat(character, stat, points_pool)
#         roll = rand(1..6)
#         if points_pool - roll < 0
#             character[stat] = points_pool
#         # check if points_pool will be 0 or less here??
#         character[stat] = roll
#         points_pool -= roll
#     end

#     def allocate_extra_points(character, points_pool)
#         # allocate extra points to highest stat?
#     end

# end







# AFTER:
# ==============================================================

class RandomCharacterGenerator
    def initialize
    end

    def new_character(name)
        character = Character.new(name: name)
        stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        points_pool = 9
        roll_stats(character, stats_array, points_pool)
        character


        # alt using .tap:
        # =====================================================
        # Character.new.tap do |character|
        #     stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        #     points_pool = 9
        #     roll_stats(character, stats_array, points_pool)
        # end
    end


    private

    def roll_stats(character, stats_array, points_pool)
        stats_array.each_with_index do |stat, index|
            roll = rand(1..6)                                           .tap {|r| puts "roll: #{r}"}
            remaining_stats = ((stats_array.length - 1) - index)        .tap {|r| puts "remaining_stats: #{r}"}
                                                                        .tap {|r| puts "points_pool (before): #{points_pool}"}
            if remaining_stats == 0
                character[stat] = points_pool
                points_pool = 0
            elsif points_pool - roll < remaining_stats
                max_points = points_pool - remaining_stats
                character[stat] = max_points
                points_pool -= max_points
            elsif points_pool - roll < 0        # same behavior as first if condition -- not DRY...
                character[stat] = points_pool
                points_pool = 0
            else
                character[stat] = roll
                points_pool -= roll
            end                                                         .tap {|r| puts "character[#{stat}]: #{character[stat]}"}
                                                                        .tap {|r| puts "points_pool (after): #{points_pool}\n\n"}
        end
    end

    def allocate_extra_points(character, points_pool)
        # allocate extra points to highest stat?
    end

end