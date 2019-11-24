require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#def new_character(name)" do
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

        it "allocates stat points so they do not exceed max roll (#{rcg.max_roll})" do
            expect(character.strength).to be_between(1, rcg.max_roll)
            expect(character.dexterity).to be_between(1, rcg.max_roll)
            expect(character.intelligence).to be_between(1, rcg.max_roll)
            expect(character.charisma).to be_between(1, rcg.max_roll)
        end

        it "saves the Character to the database" do
            expect(Character.count).to eq (starting_database_count + 1)
        end
    end
    
end