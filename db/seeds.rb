require 'faker'
require "open-uri"

puts "Cleaning Database! 🧼"
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

sonia = User.create!(first_name: "Sonia", last_name: "Chaboud", email: "sonia@test.com", password: "123456", avatar_url: "https://i.ibb.co/ykj5t3b/sonia.png", bio: "I love code!!!")
tuo = User.create!(first_name: "Tuo", last_name: "Wang", email: "tuo@test.com", password: "123456", avatar_url: "https://thumbor.forbes.com/thumbor/fit-in/1290x/https://www.forbes.com/advisor/wp-content/uploads/2023/07/top-20-small-dog-breeds.jpeg.jpg", bio: "I love code!!!")
emma = User.create!(first_name: "Emma", last_name: "Ruenzel", email: "emma@test.com", password: "123456", avatar_url: "https://avatars.githubusercontent.com/u/90188399?v=4", bio: "Hey everyone! I'm Emma, and initially, I studied linguistics and literature, but I have been working in full-stack development within languages and beekeeping (don't ask haha) for some time now. Batch #741 ☀️")
josh = User.create!(first_name: "Josh", last_name: "Smith", email: "josh@test.com", password: "123456", avatar_url: "https://avatars.githubusercontent.com/u/111142848?v=4", bio: "Hah, lol.")
kat = User.create!(first_name: "Kat", last_name: "Syndall", email: "kat@test.com", password: "123456", avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg", bio: "Kat in a hat 😻")
chris = User.create!(first_name: "Christian", last_name: "Breuckmann", email: "chris@test.com", password: "123456", avatar_url: "https://i.ibb.co/pnYp2Nz/chris.jpg", bio: "I love code!!!")
sachini = User.create!(first_name: "Sachini", last_name: "Srimali", email: "sachini@test.com", password: "123456", avatar_url: "https://i.ibb.co/TYvQN97/sachini.jpg", bio: "I love code!!!")
alex = User.create!(first_name: "Alexander", last_name: "Holz", email: "alex@test.com", password: "123456", avatar_url: "https://i.ibb.co/Tm350BV/alex.jpg", bio: "I love code!!!")
remi = User.create!(first_name: "Remi", last_name: "Li", email: "remi@test.com", password: "123456", avatar_url: "https://i.ibb.co/Zm3wtqw/remi.jpg", bio: "I love code!!!")

User.all.each do |user|
  Wishlist.create(user:)
end

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

electronics = Category.create!(name: "Electronics")
home_appliances = Category.create!(name: "Home & furniture")
toys_games = Category.create!(name: "Books, toys & video games")
clothing = Category.create!(name: "Clothing & Footwear")
beauty_personal_care = Category.create!(name: "Beauty & personal care")
musical_instruments = Category.create!(name: "Musical instruments")
pet_supplies = Category.create!(name: "Pet supplies")
sport_wellness = Category.create!(name: "Sport, health & wellness")
services = Category.create!(name: "Services")
others = Category.create!(name: "Others")

puts "10 categories have been created."

products = [
  {
    title: "EHX Cathedral",
    user_id: chris.id,
    category_id: musical_instruments.id,
    description: "Elevate your sound with the Electro-Harmonix Cathedral Stereo Reverb, a versatile pedal that offers a
    wide range of lush, ambient reverb effects. This used unit has been well-maintained and is in excellent working
    condition, offering you top-tier performance at a fraction of the cost of a new pedal.",
    image_url: "https://www.russomusic.com/cdn/shop/products/DSC_9421_a7703a5e-5fbd-444a-9072-585c13acc6f9_500x.jpg",
    condition: "used",
    price: 600
  },
  {
    title: "Singing about JavaScript",
    user_id: josh.id,
    category_id: musical_instruments.id,
    description: "Elevate your sinigng with my great teachings about singing about the console.logs of your life!!! JS 4 Life lol",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717697975/Screenshot_2024-06-06_at_20.17.33_spkxg0.jpg?_s=public-apps",
    condition: "new",
    price: 404
  },

  {
    title: "Learn Coding in Portuguese",
    user_id: chris.id,
    category_id: services.id,
    description: "Learn some portuguese (coding) with me! 🇧🇷",
    image_url: "https://assets-global.website-files.com/5cdc34afa4217f8020168210/5e727fa67d25fe70b2535346_languageIcon_portuguese.png",
    condition: "used",
    price: 100
  },

  {
    title: "Fashion workshop",
    user_id: alex.id,
    category_id: services.id,
    description: "No more C&A and H&M, dress like a prince!",
    image_url: "https://pagesix.com/wp-content/uploads/sites/3/2024/03/bianca-censori-appears-covering-purple-30903956.jpg",
    condition: "used",
    price: 100

  },

  {
    title: "Communist Manifesto",
    user_id: chris.id,
    category_id: toys_games.id,
    description: "Own a piece of history with this used copy of The Communist Manifesto by Karl Marx. A foundational
    political text with minor wear, perfect for students, historians, or collectors. Insightful and influential,
    this book is a must-have for anyone interested in political theory.",
    image_url: "https://www.marxist.com/images/stories/other/Manifesto_Image_public_domain.jpg",
    condition: "used",
    price: 10
  },

  {
    title: "Saturday Sessions",
    user_id: emma.id,
    category_id: services.id,
    description: "We offer these sessions completly for free! Just come to Le Wagon on Saturdays OR thursdays and see what will happen!",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700890/Screenshot_2024-06-06_at_21.07.50_dci4pn.jpg?_s=public-apps",
    condition: "refurbished",
    price: 40
  },

  {
    title: "Used Chessboard",
    user_id: josh.id,
    category_id: toys_games.id,
    description: "Check out our old chess board and maybe also play with us!! We also solve coding bugs hehe ♟️",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700668/Screenshot_2024-06-06_at_21.03.47_yfegqw.jpg?_s=public-apps",
    condition: "used",
    price: 110
  },

  {
    title: "Fire ant colony",
    user_id: remi.id,
    category_id: toys_games.id,
    description: "Fire ants are small, aggressive ants known for their painful stings. They are reddish-brown in color
    and are commonly found in warm climates.",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717701185/Screenshot_2024-06-06_at_21.12.20_yg2rd2.jpg?_s=public-apps",
    condition: "new",
    price: 15
  },

  {
    title: "Origami workshop",
    user_id: remi.id,
    category_id: toys_games.id,
    description: "Discover the magic of origami with this amazing used book of me! Perfect for beginners or enthusiasts,
    it's filled with captivating designs and easy-to-follow instructions. Also, you can maybe learn how to code a bird 🗞️",
    image_url: "https://i.ytimg.com/vi/C2n8BvemmNQ/maxresdefault.jpg",
    condition: "new",
    price: 55
  },

  {
    title: "Half Used Honey",
    user_id: remi.id,
    category_id: sport_wellness.id,
    description: "A jar of organic wildflower honey, half-used, with a rich, floral flavor. Perfect for sweetening tea
    or spreading on toast.",
    image_url: "https://farm8.staticflickr.com/7243/7249735358_758147d70d.jpg",
    condition: "new",
    price: 1
  },

  {
    title: "Running away from Coding Bugs",
    user_id: tuo.id,
    category_id: sport_wellness.id,
    description: "I'll teach you how to get away from your coding errors AND how to run a marathon!! 🏃🏼🏃🏼🏃🏼",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717754188/Screenshot_2024-06-07_at_11.55.39_oegcs6.jpg?_s=public-apps",
    condition: "used",
    price: 180
  },

  {
    title: "Spend day with Lucas Jinny :)",
    user_id: tuo.id,
    category_id: services.id,
    description: "Take Jinny for a walk and get a free coding lesson with the most patient angel nerd!",
    image_url: "https://i.ibb.co/bF6x1zv/DSC2734.jpg",
    condition: "used",
    price: 20
  },

  {
    title: "Massage",
    user_id: sonia.id,
    category_id: services.id,
    description: "Indulge in relaxation with our professional massage service, available in exchange for your offered
    goods or services. Let our skilled therapists melt away your stress and tension,
    leaving you refreshed and rejuvenated. Experience the ultimate in self-care today.",
    image_url: "https://townsquare.media/site/29/files/2011/09/kittenmassage.jpg",
    condition: "used",
    price: 30
  },

  {
    title: "Le Wagon borrowed chair",
    user_id: sonia.id,
    category_id: home_appliances.id,
    description: "Introducing the IKEA Shitty Used Chair – because sometimes even the worst seats have stories to
    tell. This battle-scarred warrior has endured countless movie marathons and gaming sessions. It may not be fancy,
    but it's got character and a price tag that won't break the bank. Sit back, relax, and embrace the shittiness!",
    condition: "used",
    image_url: "https://d6qwfb5pdou4u.cloudfront.net/product-images/6700001-6710000/6703450/1699185341ae0796428b7564bf00401c6773b6fcf0/1500-1500-frame-0.jpg",
    price: 20
  },

  {
    title: "Learn how to become a BM with Emma",
    user_id: emma.id,
    category_id: beauty_personal_care.id,
    description: "Learn with Emma and her assistant Precious how to become a Batch Manager (Extra points for 👻)",
    condition: "used",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717754371/Screenshot_2024-06-07_at_11.58.54_vetdbq.jpg?_s=public-apps",
    price: 90
  },

  {
    title: "Mandarin classes",
    user_id: tuo.id,
    category_id: services.id,
    description: "So you can learn the chinese beaver meme.",
    image_url: "https://img.buzzfeed.com/buzzfeed-static/static/2023-12/13/19/asset/e356f734c542/sub-buzz-488-1702494453-1.png",
    condition: "used",
    price: 130
  },

  {
    title: "PC for coding",
    user_id: sachini.id,
    category_id: electronics.id,
    description: "Rails and terminal installed. Hanna Montana OS",
    image_url: "https://live.staticflickr.com/2278/2735682932_012268ef15_b.jpg",
    condition: "used",
    price: 1220
  },

]

products.each_with_index do |product, index|
  if product[:image_url].present?
    file = URI.open(product[:image_url])
    product.delete(:image_url)
    new_product = Product.new(product)
    new_product.photo.attach(io: file, filename: "image#{index}.png", content_type: "image/png")
  else
    new_product = Product.new(product)
  end
  new_product.save
end

puts "Done! 🌱🌱🌱"
