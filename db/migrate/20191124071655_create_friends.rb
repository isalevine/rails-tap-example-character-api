class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :player_one, null: false, index: true, foreign_key: { to_table: :players }
      t.references :player_two, null: false, index: true, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
