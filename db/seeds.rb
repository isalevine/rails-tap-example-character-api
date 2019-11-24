# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all
Character.destroy_all
Friend.destroy_all


player1 = Player.create(user_name: "frak", display_name: "Ongo Gablogian")
player2 = Player.create(user_name: "dennis", display_name: "G0ld3ng0d")
player3 = Player.create(user_name: "chrundle", display_name: "4 +hU rA+z")