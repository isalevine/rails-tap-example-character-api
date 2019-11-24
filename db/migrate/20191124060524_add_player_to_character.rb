# solved error:   SQLite3::SQLException: Cannot add a NOT NULL column with default value NULL
# with this:      https://www.viget.com/articles/adding-a-not-null-column-to-an-existing-table/
# (apparently, SQLite does NOT handle the references type as well as Postgres does...?)
class AddPlayerToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :player, foreign_key: true
    change_column_null :characters, :player_id, false
  end
end
