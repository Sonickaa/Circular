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
    title: "Nike Air Max 90",
    user_id: chris.id,
    category_id: clothing.id,
    description: "Step up your sneaker game with these iconic Nike Air Max 90s in vibrant turquoise. Featuring premium
    materials, a cushioned sole, and classic design, these kicks offer both style and comfort. Lightly worn,
    well-maintained, and ready to add a pop of color to your collection. Don’t miss out!",
    image_url: "https://sneakernews.com/wp-content/uploads/2019/12/Nike-Air-Max-90-CD0490-104-5.jpg",
    condition: "used",
    price: 120
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
    category_id: others.id,
    description: "We offer these sessions completly for free! Just come to Le Wagon on Saturdays OR thursdays and see what will happen!",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700890/Screenshot_2024-06-06_at_21.07.50_dci4pn.jpg?_s=public-apps",
    condition: "refurbished",
    price: 40
  },

  {
    title: "Personal Styling 😎",
    user_id: alex.id,
    category_id: services.id,
    description: "Trying swipe services? Upgrade your style with personalized flair! Offering expert personal styling
    to elevate your look and confidence. Let's redefine your wardrobe together!",
    image_url: "https://images.squarespace-cdn.com/content/v1/5f21b3c0862b9f38f883a002/7934ef35-cdd7-4681-a72d-924094eee139/Men%27s+before+and+after+transformation-will.jpg",
    condition: "refurbished",
    price: 85
  },

  {
    title: "Used Chessboard",
    user_id: josh.id,
    category_id: others.id,
    description: "Check out our old chess board and maybe also play with us!! We also solve coding bugs hehe ♟️",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700668/Screenshot_2024-06-06_at_21.03.47_yfegqw.jpg?_s=public-apps",
    condition: "used",
    price: 110
  },

  {
    title: "Origami Book",
    user_id: remi.id,
    category_id: toys_games.id,
    description: "Discover the magic of origami with this amazing used book of me! Perfect for beginners or enthusiasts,
    it's filled with captivating designs and easy-to-follow instructions. Also, you can maybe learn how to code a bird 🗞️",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700024/Screenshot_2024-06-06_at_20.53.01_xcyybd.jpg?_s=public-apps",
    condition: "new",
    price: 55
  },

  {
    title: "Suculents",
    user_id: remi.id,
    category_id: home_appliances.id,
    description: "Enhance your space with these gently used succulents! Each one carries unique charm and character,
    adding a touch of greenery to your home. Perfect for those seeking low-maintenance beauty. Grab these pre-loved
    succulents and bring life to your surroundings!",
    image_url: "https://i.etsystatic.com/21530912/r/il/64056b/2451976559/il_fullxfull.2451976559_2dpt.jpg",
    condition: "used",
    price: 3
  },

  {
    title: "Running away from Coding Bugs",
    user_id: tuo.id,
    category_id: sport_wellness.id,
    description: "I'll teach you how to get away from your coding errors AND how to run a marathon!! 🏃🏼🏃🏼🏃🏼",
    image_url: "https://res.cloudinary.com/dk5glvhr6/image/upload/fl_preserve_transparency/v1717700891/Screenshot_2024-06-06_at_21.07.59_kmgifa.jpg?_s=public-apps",
    condition: "used",
    price: 180
  },

  {
    title: "Walking dog service :)",
    user_id: tuo.id,
    category_id: services.id,
    description: "Embark offers professional walking dog services tailored to your furry friend's needs. Our experienced
    team ensures your dog gets the exercise and attention they deserve, leaving you with peace of mind.
    Let's keep those tails wagging together!",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/5/51/Dog_walker_-_Buenos_Aires.jpg",
    condition: "used",
    price: 20
  },

  {
    title: "Mandarin classes",
    user_id: tuo.id,
    category_id: services.id,
    description: "Want to learn some basic Mandarin? Reach me out!",
    image_url: "https://www.languagebird.com/wp-content/uploads/2021/06/Mandarin-Language-e1629327465771.jpg",
    condition: "new",
    price: 65
  },

  {
    title: "Virgil's Off White",
    user_id: tuo.id,
    category_id: clothing.id,
    description: "Elevate your style with our gently used Off-White belt. Crafted with impeccable design and quality,
    it adds a touch of luxury to any outfit. Make a statement with this iconic accessory,
    perfect for fashion enthusiasts seeking a stylish edge.",
    image_url: "https://img.vitkac.com/uploads/product_thumb/PASEK%20OMRB012S22%20FAB002-1810/up/2.jpg",
    condition: "used",
    price: 145
  },

  {
    title: "Massage",
    user_id: sonia.id,
    category_id: services.id,
    description: "Indulge in relaxation with our professional massage service, available in exchange for your offered
    goods or services. Let our skilled therapists melt away your stress and tension,
    leaving you refreshed and rejuvenated. Experience the ultimate in self-care today.",
    image_url: "https://i0.wp.com/columbiaintegratedhealth.com/wp-content/uploads/2018/01/columbia-integrated-health-new-westminster-massage-therapy.jpg",
    condition: "used",
    price: 110
  },

  {
    title: "Kitty food",
    user_id: sonia.id,
    category_id: pet_supplies.id,
    description: "Treat your feline friend to the finest with gently used Almo Nature cat food.
    Crafted with premium ingredients,
    it provides the nourishment and flavor your cat craves. Give your pet the best with Almo Nature,
    perfect for pampered kitties.",
    image_url: "https://m.media-amazon.com/images/I/61ZIEm-MRsL.jpg",
    condition: "used",
    price: 25
  },

  {
    title: "Everlast vintage gloves",
    user_id: sonia.id,
    category_id: sport_wellness.id,
    description: "Get punchy with our pre-loved Everlasting Boxing Gloves! They've survived more rounds than Rocky and
    still pack a punch. Perfect for knocking out stress or sparring with shadows.
    Step into the ring of hilarity with these gloves - they've got a punchline of their own!",
    condition: "used",
    image_url: "https://i.ebayimg.com/images/g/aRsAAOSwAh9jnUYE/s-l1600.jpg",
    price: 60
  },

  {
    title: "Asus gamer laptop",
    user_id: sonia.id,
    category_id: sport_wellness.id,
    description: "Level up your gaming arsenal with our used ASUS Gamer Laptop. It's seen its fair share of epic battles
    and late-night raids, but it's ready for more. With specs that could make a dragon jealous,
    this laptop is your trusty sidekick in virtual adventures. Get ready to slay some pixels!",
    condition: "used",
    image_url: "https://classifieds.248am.com/oc-content/uploads/351/55716.jpg",
    price: 525
  },

  {
    title: "Ikea used chair 🇸🇪",
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
    title: "Face mask melumé",
    user_id: sachini.id,
    category_id: beauty_personal_care.id,
    description: "Introducing Melume's latest face mask – your new must-have accessory for both style and safety.
    Crafted with care and comfort in mind, this mask blends fashion with functionality.
    With a range of vibrant colors and patterns, you can express your personality while staying protected. Upgrade your
    mask game with Melume today!",
    condition: "used",
    image_url: "https://www.melume-skinscience.com/cdn/shop/files/Produktfotos_1000x1000_NEU_19_1000x.jpg",
    price: 70
  },

  {
    title: "Sri Lankan Chatties 🇱🇰",
    user_id: sachini.id,
    category_id: beauty_personal_care.id,
    description: "
    Experience the authentic taste of Sri Lankan cuisine with our set of two traditional chatties! Handcrafted by
    skilled artisans using natural clay, these pots bring the essence of Sri Lankan cooking to
    your kitchen.",
    condition: "used",
    image_url: "https://soulkitchenblog.wordpress.com/wp-content/uploads/2011/12/clay-chatties.jpg",
    price: 90
  },

  {
    title: "Learn how to become a BM with Emma",
    user_id: emma.id,
    category_id: beauty_personal_care.id,
    description: "Learn with Emma and her assistant Precious how to become a Batch Manager (Extra points for 👻)",
    condition: "used",
    image_url: "https://soulkitchenblog.wordpress.com/wp-content/uploads/2011/12/clay-chatties.jpg",
    price: 90
  }
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
