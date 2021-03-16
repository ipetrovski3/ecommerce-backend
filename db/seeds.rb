# Seed the database with the neccessary data to work with in development

2.times do
  Category.create(
    name: Faker::Commerce.material
  )
end

10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 6),
    price: rand(1.2...76.9),
    category_id: 1
  )
end

5.times do
  Order.create(
    product_id: rand(1..10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_name,
    town: Faker::Address.street_address,
    phone: Faker::PhoneNumber.cell_phone,
    qty: rand(3),
    note: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 6)
  )
end

Admin.create(
  email: 'email@email.com',
  password: '123123123',
  password_confirmation: '123123123'
)

Admin.create(
  email: 'some@email.com',
  password: '123123123',
  password_confirmation: '123123123'
)

puts "Database seeded with Categories: #{Category.count}, Products: #{Product.count}, Orders: #{Order.count}, Admins: #{Admin.count}"
