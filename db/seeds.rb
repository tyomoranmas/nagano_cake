# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(name: "ケーキ")

Genre.create!(name: "クッキー")

Genre.create!(name: "チョコレート")

Genre.create!(name: "プリン・ゼリー")

Genre.create!(name: "和菓子")

Genre.create!(name: "アイス")

Admin.create!(email: "abc@abc.com",
							password: "password",
							password_confirmation: "password")
