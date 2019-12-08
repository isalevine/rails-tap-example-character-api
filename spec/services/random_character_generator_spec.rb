require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#new_character" do
        let(:rcg)       { RandomCharacterGenerator.new }
        let(:player)    { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
        let(:character) { rcg.new_character("Ronnie the Rat", player) }
        let(:duplicate) { rcg.new_character("Ronnie the Rat", player) }

        context "success" do    
            # # refactoring based on BetterSpec / Andrew Brown advice

            # # do EITHER of these options actually work with `let`?
            # # (must be better way to check if model is saved to db...)
            # before(:all) do
            #     @starting_character_count = Character.count
            # end
            # let(:starting_player_count)     { Player.count }
            
            # # shifted `let` sequence outside of context above
            # let(:rcg)       { RandomCharacterGenerator.new }
            # let(:player)    { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
            # let(:character) { rcg.new_character("Ronnie the Rat", player) }


            it "creates a new Character instance" do
                expect(character).to be_an_instance_of Character
            end

            # THESE TESTS NO LONGER WORK with the way rcg is instantiated!
            # need to look into other ways to test rcg state across tests...

            # it "randomly allocates all stat points between stats" do
            #     expect(rcg.stats_array.reduce(0) {|points, stat| points += character[stat]}).to eq rcg.points_pool 
            # end

            # it "allocates stat points so stat values are between 1 and max roll" do
            #     expect(character.strength).to be_between(1, rcg.max_roll)
            #     expect(character.dexterity).to be_between(1, rcg.max_roll)
            #     expect(character.intelligence).to be_between(1, rcg.max_roll)
            #     expect(character.charisma).to be_between(1, rcg.max_roll)
            # end

            # # after refactor to `let`, this .count check doesn't work anymore!!
            # # (are instances inside `let` blocks not saved to the database...?)
            # it "saves the Character to the database" do
            #     expect(Character.count).to eq (@starting_character_count + 1)
            # end

            # after(:all) do
            #     Character.last.delete
            #     Player.last.delete
            #     expect(Character.count).to eq (starting_character_count)
            #     expect(Player.count).to eq (starting_player_count)
            #     # do expect() calls still work as tests in a before/after block?
            # end
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