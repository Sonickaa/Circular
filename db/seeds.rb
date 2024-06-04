# db/seeds.rb

# Assuming you have User and Category models
require 'faker'
require "open-uri"


OfferProduct.destroy_all
Message.destroy_all
Review.destroy_all
Offer.destroy_all
ProductWishlist.destroy_all
UserCategory.destroy_all
Wishlist.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all


sonia = User.create!(first_name: "Sonia", last_name: "Chaboud", email: "sonia@test.com", password: "123456")
tuo = User.create!(first_name: "Tuo", last_name: "Chaboud", email: "tuo@test.com", password: "123456")
emma = User.create!(first_name: "Emma", last_name: "Chaboud", email: "emma@test.com", password: "123456")
chris = User.create!(first_name: "Chris", last_name: "Chaboud", email: "chris@test.com", password: "123456")

User.all.each do |user|
  Wishlist.create(user: user)
end


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
services = Category.create!(name: "Services")

puts "20 categories have been created."


products = [
  {
    title: "Honda Civic Car",
    user_id: chris.id,
    category_id: automotive.id,
    description: "Reliable and fuel-efficient sedan with advanced safety features.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/6/6d/2017_Honda_Civic_SR_VTEC_1.0_Front.jpg",
    condition: "new",
    price: 22000
  },
  {
    title: "Yamaha Acoustic Guitar",
    user_id: sonia.id,
    category_id: musical_instruments.id,
    description: "High-quality acoustic guitar with excellent sound and build quality.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 499
  },
  {
    title: "HP OfficeJet Pro 9015",
    user_id: tuo.id,
    category_id: office_supplies.id,
    description: "All-in-one wireless printer with fast print speeds and high-quality output.",#
    image_url: "https://www.hp.com/content/dam/sites/worldwide/printers/officejet-pro-printers-na-redesign-08-2023/dm-version/Feature%20Focus_Desktop_DM_6@2x.jpg",
    condition: "new",
    price: 229
  },
  {
    title: "Fiskars Garden Tool Set",
    user_id: emma.id,
    category_id: gardening.id,
    description: "Durable and ergonomic garden tools for all your gardening needs.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 39
  },
  {
    title: "Blue Buffalo Dog Food",
    user_id: chris.id,
    category_id: pet_supplies.id,
    description: "High-protein, grain-free dog food made with real meat.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 45
  },
  {
    title: "Philips Norelco Electric Shaver",
    user_id: sonia.id,
    category_id: health_wellness.id,
    description: "Advanced electric shaver with multi-directional shaving heads.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 89
  },
  {
    title: "BabyBjorn Carrier One",
    user_id: tuo.id,
    category_id: baby_products.id,
    description: "Comfortable and ergonomic baby carrier for infants and toddlers.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 189
  },
  {
    title: "Puma Running T-Shirt",
    user_id: emma.id,
    category_id: clothing.id,
    description: "Lightweight and breathable running t-shirt for optimal performance.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 25
  },
  {
    title: "Home Cleaning Service",
    user_id: chris.id,
    category_id: services.id,
    description: "Professional home cleaning service with flexible scheduling options.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 100
  },
  {
    title: "Apple AirPods Pro",
    user_id: sonia.id,
    category_id: electronics.id,
    description: "Noise-cancelling wireless earbuds with high-quality sound and transparency mode.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 249
  },
  {
    title: "Dyson V11 Vacuum Cleaner",
    user_id: tuo.id,
    category_id: home_appliances.id,
    description: "High-performance cordless vacuum with powerful suction and advanced filtration.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 599
  },
  {
    title: "IKEA Billy Bookcase",
    user_id: emma.id,
    category_id: furniture.id,
    description: "Versatile and customizable bookcase for home or office use.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 79
  },
  {
    title: "LEGO Star Wars Millennium Falcon",
    user_id: chris.id,
    category_id: toys_games.id,
    description: "Iconic Star Wars ship with over 7,500 pieces for endless building fun.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 799
  },
  {
    title: "Harry Potter Box Set",
    user_id: sonia.id,
    category_id: books.id,
    description: "Complete collection of the Harry Potter series by J.K. Rowling.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 99
  },
  {
    title: "Nike Air Max 270",
    user_id: tuo.id,
    category_id: footwear.id,
    description: "Comfortable and stylish sneakers with Air Max cushioning.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 150
  },
  {
    title: "Adidas UltraBoost Running Shoes",
    user_id: emma.id,
    category_id: sports_equipment.id,
    description: "High-performance running shoes with responsive cushioning.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 180
  },
  {
    title: "Dove Nourishing Body Wash",
    user_id: chris.id,
    category_id: beauty_personal_care.id,
    description: "Gentle and moisturizing body wash for soft and smooth skin.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 6
  },
  {
    title: "Pandora Charm Bracelet",
    user_id: sonia.id,
    category_id: jewelry.id,
    description: "Elegant charm bracelet with customizable charms.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 75
  },
  {
    title: "Bosch Cordless Drill",
    user_id: tuo.id,
    category_id: tools_hardware.id,
    description: "Powerful cordless drill with multiple speed settings.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 99
  },
  {
    title: "The Legend of Zelda: Breath of the Wild",
    user_id: emma.id,
    category_id: video_games.id,
    description: "Critically acclaimed open-world adventure game for the Nintendo Switch.",#
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
    condition: "new",
    price: 59
  },
  {
    title: "The Legend of Sonia: Breath of the Wild",
    user_id: emma.id,
    category_id: video_games.id,
    description: "Critically acclaimed open-world adventure game for the Nintendo Switch.",
    image_url: "https://tse3.mm.bing.net/th?id=OIP.MQoX2BnpzRODg6MC6XmQpAHaFs&pid=Api&P=0&h=180",
    condition: "new",
    price: 59
  }
]

products.each_with_index do |product, index|
  file = URI.open(product[:image_url])
  product.delete(:image_url)
  new_product = Product.new(product)
  new_product.photo.attach(io: file, filename: "image#{index}.png", content_type: "image/png")
  new_product.save
end
