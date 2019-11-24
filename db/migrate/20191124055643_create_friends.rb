# per: https://stackoverflow.com/questions/34697634/same-model-for-two-belongs-to-associations-migration/34697712

class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :player_one, null: false, index: true, foreign_key: true
      t.references :player_two, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
