# db/seeds.rb

# Assuming you have User and Category models
require 'faker'

User.destroy_all
Product.destroy_all
Category.destroy_all

sonia = User.create!(first_name: "Sonia", last_name: "Chaboud", email: "sonia@test.com", password: "123456")
tuo = User.create!(first_name: "Tuo", last_name: "Chaboud", email: "tuo@test.com", password: "123456")
emma = User.create!(first_name: "Emma", last_name: "Chaboud", email: "emma@test.com", password: "123456")
chris = User.create!(first_name: "Chris", last_name: "Chaboud", email: "chris@test.com", password: "123456")

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

# Array of 20 category names for products
electronics = Category.create!(name: "Electronics")
home_appliances = Category.create!(name: "Home Appliances")
furniture = Category.create!(name: "Furniture")
toys_games = Category.create!(name: "Toys & Games")
books = Category.create!(name: "Books")
clothing = Category.create!(name: "Clothing")
footwear = Category.create!(name: "Footwear")
sports_equipment = Category.create!(name: "Sports Equipment")
beauty_personal_care = Category.create!(name: "Beauty & Personal Care")
jewelry = Category.create!(name: "Jewelry")
automotive = Category.create!(name: "Automotive")
musical_instruments = Category.create!(name: "Musical Instruments")
office_supplies = Category.create!(name: "Office Supplies")
gardening = Category.create!(name: "Gardening")
pet_supplies = Category.create!(name: "Pet Supplies")
grocery = Category.create!(name: "Grocery")
health_wellness = Category.create!(name: "Health & Wellness")
tools_hardware = Category.create!(name: "Tools & Hardware")
video_games = Category.create!(name: "Video Games")
baby_products = Category.create!(name: "Baby Products")

puts "20 categories have been created."


products = [
  {
    title: "Apple iPhone 13",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Latest model with A15 Bionic chip and advanced dual-camera system.",
    condition: "new",
    price: 999
  },
  {
    title: "Samsung Galaxy S21",
    user_id: emma.id,
    category_id: electronics.id,
    description: "Flagship smartphone with Dynamic AMOLED display and 5G support.",
    condition: "new",
    price: 799
  },
  {
    title: "Sony WH-1000XM4 Headphones",
    user_id: chris.id,
    category_id: electronics.id,
    description: "Industry-leading noise cancellation with exceptional sound quality.",
    condition: "new",
    price: 349
  },
  {
    title: "Dell XPS 13 Laptop",
    user_id: tuo.id,
    category_id: electronics.id,
    description: "High-performance laptop with InfinityEdge display and Intel i7 processor.",
    condition: "new",
    price: 1299
  },
  {
    title: "Apple MacBook Air",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Lightweight laptop with M1 chip and Retina display.",
    condition: "new",
    price: 999
  },
  {
    title: "Nintendo Switch",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Hybrid gaming console with a variety of popular games.",
    condition: "new",
    price: 299
  },
  {
    title: "Sony PlayStation 5",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Next-gen gaming console with ultra-high-speed SSD and 8K output.",
    condition: "new",
    price: 499
  },
  {
    title: "Bose QuietComfort 35 II",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Wireless Bluetooth headphones with world-class noise cancellation.",
    condition: "new",
    price: 299
  },
  {
    title: "Canon EOS R5 Camera",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Full-frame mirrorless camera with 45MP sensor and 8K video recording.",
    condition: "new",
    price: 3899
  },
  {
    title: "Fitbit Charge 4",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Advanced fitness tracker with built-in GPS and heart rate monitoring.",
    condition: "new",
    price: 149
  }
]

products.each do |product|
  Product.create!(product)
end

puts "10 products have been created."
