# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
  Category.create(
    name: 'CategoryTest'
  )
end

10.times do
  Product.create(
    name: 'product1',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra',
    price: 3.99,
    category_id: 1
  )
end

5.times do
  Order.create(
    product_id: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_name,
    town: Faker::Address.street_address,
    phone: Faker::PhoneNumber.cell_phone,
    qty: rand(3),
    note: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 6)
  )
end

puts "Database seeded with Categories: #{Category.count}, Products: #{Product.count}, Orders: #{Order.count}"