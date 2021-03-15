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
