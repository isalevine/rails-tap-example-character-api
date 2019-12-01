require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#new_character" do
        starting_character_count = Character.count
        starting_player_count = Player.count

        rcg = RandomCharacterGenerator.new
        player = Player.create(user_name: "Ronald McDonald", display_name: "Mac")
        character = rcg.new_character("Ronnie the Rat", player)

        it "creates a new Character instance" do
            expect(character).to be_an_instance_of Character
        end

        it "randomly allocates all #{rcg.points_pool} stat points between #{rcg.stats_array.to_s}" do
            expect(rcg.stats_array.reduce(0) {|points, stat| points += character[stat]}).to eq rcg.points_pool 
        end

        it "allocates stat points so stat values are between 1 and max roll (#{rcg.max_roll})" do
            expect(character.strength).to be_between(1, rcg.max_roll)
            expect(character.dexterity).to be_between(1, rcg.max_roll)
            expect(character.intelligence).to be_between(1, rcg.max_roll)
            expect(character.charisma).to be_between(1, rcg.max_roll)
        end

        it "saves the Character to the database" do
            expect(Character.count).to eq (starting_character_count + 1)
        end

        after(:all) do
            Character.last.delete
            Player.last.delete
            expect(Character.count).to eq (starting_character_count)
            expect(Player.count).to eq (starting_player_count)
            # add a starting_db_player_count variable to check for Player deleted too?
        end
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