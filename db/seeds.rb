# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(genre_id: 2,
				name:"モンブラン!!",
				image: "",
				introduction:"美味しいチーズケーキです。",
				tax_excluded_price: 350)
Product.create!(genre_id: 2,
				name:"",
				image: "フルーツタルト!!",
				introduction:"期間限定のチーズケーキです。",
				tax_excluded_price: 900)
Product.create!(genre_id: 2,
				name:"フルーツタルト!!",
				image: "",
				introduction:"期間限定のチーズケーキです。",
				tax_excluded_price: 600)
Product.create!(genre_id: 2,
				name:"テストケーキ２!!",
				image: "",
				introduction:"期間限定のチーズケーキです。",
				tax_excluded_price: 600)

