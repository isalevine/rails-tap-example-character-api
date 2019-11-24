require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#def new_character(name)" do
        starting_database_count = Character.count
        stat_points = 9
        stat_max = 6        # highest value of RNG, ln.82: roll = rand(1..6)

        random_character_generator = RandomCharacterGenerator.new
        character = random_character_generator.new_character("Mac")

        it "creates a new Character instance" do
            expect(character).to be_an_instance_of Character
        end

        it "randomly allocates all #{stat_points} stat points between Strength, Dexterity, Intelligence, and Charisma" do
            expect(character.strength + character.dexterity + character.intelligence + character.charisma).to eq stat_points
        end

        it "allocates stat points so they do not exceed maximum amount (#{stat_max})" do
            expect(character.strength).to be_between(1, stat_max)
            expect(character.dexterity).to be_between(1, stat_max)
            expect(character.intelligence).to be_between(1, stat_max)
            expect(character.charisma).to be_between(1, stat_max)
        end

        it "saves the Character to the database" do
            expect(Character.count).to eq (starting_database_count + 1)
        end
    end
    
end