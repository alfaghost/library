# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(:name => "Admin",
                     :email => "alfaghost1@gmail.com",
                     :password => "22361234",
                     :password_confirmation => "22361234")
49.times do |n|
  name = Faker::Name.name
  email = "example-#{ n }@mail.com"
  password = "password"
  User.create!(:name => name,
               :email => email,
               :password => password,
               :password_confirmation => password)
end


book = Book.create!(:name => 'A Brief History of Time',
                    :description => Faker::Lorem.sentence(5),
                    :user_id => 1)
50.times do
  User.first.books.create!(name: Faker::Name.name, description: Faker::Lorem.sentence(5))
end
