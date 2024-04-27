# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do #userのダミーデータ作成
	User.create!(
		first_name: Faker::Name.first_name, #Fakerの文法は参考のfaker github/usage
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: 'password',
		password_confirmation: 'password'
	)
end
  
20.times do |index| #boardダミーデータ作成
	Board.create!(
		user: User.offset(rand(User.count)).first, #ユーザー指定
		title: "タイトル#{index}", 
		body: "本文#{index}"
	)
end