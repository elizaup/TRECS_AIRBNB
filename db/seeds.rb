# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Cleaning Items'
Item.destroy_all

# 20 fake users:
puts 'Creating 20 fake users...'
20.times do
  user = User.create!(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    address: Faker::Address.street_address,
    password: "123456"
  )
  3.times do
    Item.create!(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      condition: Faker::Commerce.material,
      category: ["Jumper & Sweaters", "Dresses", "Skirts", "Tops & T-shirts", "Trousers", "Active wear", "Bags", "Shoes", "Accessories"].sample,
      brand: Faker::Commerce.brand,
      available: Faker::Boolean.boolean,
      user: user
    )
  end
end
puts 'Finished!'

# # 5 fake rentals:
# puts 'Creating 5 fake rentals...'
# 5.times do
#   Rental.create!(
#     start_date: Faker::Date.in_date_period(month: 1),
#     end_date: Faker::Date.in_date_period(month: 2),
# TODO user id
# TODO item id
#   )
# end
# puts 'Finished!'
