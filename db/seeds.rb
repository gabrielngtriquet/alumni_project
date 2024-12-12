# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Clear existing data (optional)

# db/seeds.rb

20.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    password: "password",
    password_confirmation: "password",
    name: "User #{i+1}",
    dob: Date.new(1980 + rand(30), rand(1..12), rand(1..28)),
    profile_picture: "https://via.placeholder.com/150",
    country_of_residence: ["USA", "Canada", "UK", "Germany", "France"].sample,
    industry_of_occupation: ["Finance", "Tech", "Education", "Healthcare", "Retail"].sample,
    company: ["Company A", "Company B", "Company C", "Startup X", "Global Corp"].sample,
    city_of_residence: ["New York", "Toronto", "London", "Berlin", "Paris"].sample,
    student: [true, false].sample,
    professor: [true, false].sample,
    admin: false,
    alumn: true
  )
end


#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
