require 'rails_helper'

RSpec.describe RandomCharacterGenerator do

    describe "#new_character" do
        let(:rcg)       { RandomCharacterGenerator.new }
        let(:player)    { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
        let(:character) { rcg.new_character("Ronnie the Rat", player) }
        let(:duplicate) { rcg.new_character("Ronnie the Rat", player) }

        context "success" do    
            it { expect(character).to be_an_instance_of Character}
        end

        context "failure (non-unique name)" do
            it "returns a message that Character is not created" do
                expect(character).to be_an_instance_of Character
                expect(duplicate).to eq "Character not created -- name already exists!"
            end
        end
    end
end