require 'rails_helper'

Rspec.describe RandomCharacterGeneratorSpec do

    describe "#def new_character(name)" do
        random_character_generator = RandomCharacterGenerator.new

        it "creates a new Character instance" do
        end

        it "creates a points_pool variable with 20 starting points" do
        end

        it "randomly allocates 20 points between Strength, Dexterity, Intelligence, and Charisma" do
        end

        it "saves the Character to the database" do
        end
    end
    
end