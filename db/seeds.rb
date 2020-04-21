# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(name: "ケーキ")
           

Genre.create!(name: "ケーキ2")
           

Genre.create!(name: "ケーキ3")
           

Genre.create!(name: "ケーキ4")
           

Product.create!(genre_id: 1,
									name: "ショートケーキ",
									introduction: "美味しいショートケーキ",
									tax_excluded_price: "500",
									image_id: "")
Product.create!(genre_id: 2,
									name: "モンブラン",
									introduction: "美味しいモンブラン",
									tax_excluded_price: "400",
								  image_id: "")
Product.create!(genre_id: 3,
									name: "ロールケーキ",
									introduction: "美味しいロールケーキ",
									tax_excluded_price: "550",
									image_id: "")
Product.create!(genre_id: 4,
									name: "ショコラ",
									introduction: "美味しいショコラ",
									tax_excluded_price: "500",
									image_id: "")