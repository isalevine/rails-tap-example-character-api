# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_24_071655) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "intelligence"
    t.integer "charisma"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_id", null: false
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "player_one_id", null: false
    t.integer "player_two_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_one_id"], name: "index_friends_on_player_one_id"
    t.index ["player_two_id"], name: "index_friends_on_player_two_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "user_name"
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "players"
  add_foreign_key "friends", "players", column: "player_one_id"
  add_foreign_key "friends", "players", column: "player_two_id"
end
