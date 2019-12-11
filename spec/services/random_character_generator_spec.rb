require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#new_character" do
        let(:rcg)       { RandomCharacterGenerator.new }
        let(:player)    { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
        let(:character) { rcg.new_character("Ronnie the Rat", player) }
        let(:duplicate) { rcg.new_character("Ronnie the Rat", player) }

        context "success" do    
            # # refactoring based on BetterSpec / Andrew Brown advice
            it { expect(character).to be_an_instance_of Character}

            it "randomly allocates all stat points between stats" do
                expect(rcg.stats_array.reduce(0) {|points, stat| points += character[stat]}).to eq rcg.points_pool 
            end

            it "allocates stat points so stat values are between 1 and max roll" do
                expect(character.strength).to be_between(1, rcg.max_roll)
                expect(character.dexterity).to be_between(1, rcg.max_roll)
                expect(character.intelligence).to be_between(1, rcg.max_roll)
                expect(character.charisma).to be_between(1, rcg.max_roll)
            end

            # need a new way to check if Character is saved to database,
            # the let(:starting_character_count) refactor didn't work...
        end

        context "failure (non-unique name)" do
            it "returns a message that Character is not created" do
                expect(character).to be_an_instance_of Character
                expect(duplicate).to eq "Character not created -- name already exists!"
            end

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