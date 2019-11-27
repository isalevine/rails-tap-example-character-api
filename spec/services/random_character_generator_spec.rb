require 'rails_helper'


# BEFORE: (hard-coding stat_points and stat_max to match same hard-coded values in rcg service object)
# ====================================================================================================
# RSpec.describe RandomCharacterGenerator do

#     describe "#def new_character(name)" do
#         starting_database_count = Character.count

#         random_character_generator = RandomCharacterGenerator.new
#         character = random_character_generator.new_character("Mac")

#         stat_points = 9
#         stat_max = 6        # highest value of RNG, ln.82: roll = rand(1..6)

#         it "creates a new Character instance" do
#             expect(character).to be_an_instance_of Character
#         end

#         it "randomly allocates all #{stat_points} stat points between Strength, Dexterity, Intelligence, and Charisma" do
#             expect(character.strength + character.dexterity + character.intelligence + character.charisma).to eq stat_points
#         end

#         it "allocates stat points so they do not exceed maximum amount (#{stat_max})" do
#             expect(character.strength).to be_between(1, stat_max)
#             expect(character.dexterity).to be_between(1, stat_max)
#             expect(character.intelligence).to be_between(1, stat_max)
#             expect(character.charisma).to be_between(1, stat_max)
#         end

#         it "saves the Character to the database" do
#             expect(Character.count).to eq (starting_database_count + 1)
#         end
#     end
    
# end



# AFTER:
# ====================================================================================================
RSpec.describe RandomCharacterGenerator do

    describe "#new_character(name)" do
        starting_database_count = Character.count

        rcg = RandomCharacterGenerator.new
        player = Player.create(user_name: "Ronald McDonald", display_name: "Mac")
        character = rcg.new_character("Ronnie the Rat", player)

        it "creates a new Character instance" do
            expect(character).to be_an_instance_of Character
        end

        it "randomly allocates all #{rcg.points_pool} stat points between #{rcg.stats_array.to_s} " do
            expect(rcg.stats_array.reduce(0) {|points, stat| points += character[stat]}).to eq rcg.points_pool 
        end

        # change text to reflect that test is for BETWEEN 1 - max_roll
        it "allocates stat points so they do not exceed max roll (#{rcg.max_roll})" do
            expect(character.strength).to be_between(1, rcg.max_roll)
            expect(character.dexterity).to be_between(1, rcg.max_roll)
            expect(character.intelligence).to be_between(1, rcg.max_roll)
            expect(character.charisma).to be_between(1, rcg.max_roll)
        end

        it "saves the Character to the database" do
            expect(Character.count).to eq (starting_database_count + 1)
        end

        # add a line to remove last Character (and Player) from db to clean it up??
    end


    # RUNNING BOTH TESTS SIMULTANEOUSLY SCREWS UP "saves the Character to the database" COUNT ABOVE -- NO IDEA WHY...
    
    # describe "#benchmark running rcg.new_character(name) 100 times" do
    #     starting_database_count = Character.count
    #     rcg = RandomCharacterGenerator.new
    #     player = Player.create(user_name: "Ronald McDonald", display_name: "Mac")

    #     start_time = Time.now
    #     100.times do
    #         character = rcg.new_character("Ronnie the Rat", player)
    #     end
    #     total_time = Time.now - start_time
    #     puts "Benchmark for rcg.new_character 100 times: #{total_time} seconds"

    #     it "successfully adds 100 characters to the database" do
    #         expect(Character.count).to eq (starting_database_count + 100)
    #     end
    # end

end