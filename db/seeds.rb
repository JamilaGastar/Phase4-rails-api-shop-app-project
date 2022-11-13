# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: "Jamila", 
username: "test_user", 
password: "secretP9!", 
phone_number: "0423181567", 
email_address: "testemail@test.com", 
location: "Test Suburb, 1234",
bio: "Bio", 
image_url: "https://via.placeholder.com/150")