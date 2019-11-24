require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#def new_character(name)" do
        # use a before_each block on this?
        random_character_generator = RandomCharacterGenerator.new
        character = random_character_generator.new_character("Mac")

        it "creates a new Character instance" do
            expect(character).to be_an_instance_of Character
        end

        it "creates a points_pool variable with 20 starting points" do
        end

        it "randomly allocates 20 points between Strength, Dexterity, Intelligence, and Charisma" do
        end

        it "saves the Character to the database" do
        end
    end
    
end