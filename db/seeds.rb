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

sonia = User.create!(first_name: "Sonia", last_name: "Chaboud", email: "sonia@test.com", password: "123456", avatar_url: "https://i.ibb.co/ykj5t3b/sonia.png")
tuo = User.create!(first_name: "Tuo", last_name: "Wang", email: "tuo@test.com", password: "123456", avatar_url: "https://thumbor.forbes.com/thumbor/fit-in/1290x/https://www.forbes.com/advisor/wp-content/uploads/2023/07/top-20-small-dog-breeds.jpeg.jpg")
emma = User.create!(first_name: "Emma", last_name: "Teacher", email: "emma@test.com", password: "123456", avatar_url: "https://i.ibb.co/BjC2L1V/tuo.jpg")
chris = User.create!(first_name: "Christian", last_name: "Breuckmann", email: "chris@test.com", password: "123456", avatar_url: "https://i.ibb.co/pnYp2Nz/chris.jpg")
sachini = User.create!(first_name: "Sachini", last_name: "Srimali", email: "sachini@test.com", password: "123456", avatar_url: "https://i.ibb.co/TYvQN97/sachini.jpg")
alex = User.create!(first_name: "Alexander", last_name: "Holz", email: "alex@test.com", password: "123456", avatar_url: "https://i.ibb.co/Tm350BV/alex.jpg")
remi = User.create!(first_name: "Remi", last_name: "Li", email: "remi@test.com", password: "123456", avatar_url: "https://i.ibb.co/Zm3wtqw/remi.jpg")

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
    title: "Portuguese basic lessons",
    user_id: chris.id,
    category_id: services.id,
    description: "Learn some portuguese with me!",
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
    title: "Seahaven t-shirt",
    user_id: chris.id,
    category_id: clothing.id,
    description: "Show your love for Seahaven with this Halo of Hurt T-shirt. Lightly worn and in excellent condition,
     this tee features the iconic album artwork. Perfect for fans and collectors alike, it offers a stylish way
     to rep your favorite band.",
    image_url: "https://www.coldcutsmerch.com/cdn/shop/products/SEAHAVENSEH005CURSETHESMILESHIRTMOCK.jpg",
    condition: "used",
    price: 40
  },

  {
    title: "CR7 Real Madrid tricot",
    user_id: alex.id,
    category_id: clothing.id,
    description: "Own a piece of football history with this CR7 Real Madrid long sleeve jersey. Lightly worn but
    well-maintained, its perfect for any Ronaldo fan. Stylish, iconic, and ready to wear! Don’t miss out!",
    image_url: "https://i.ebayimg.com/images/g/SHUAAOSwuwpgYu3p/s-l1200.jpg",
    condition: "used",
    price: 80
  },

  {
    title: "IPad 1st Gen",
    user_id: alex.id,
    category_id: electronics.id,
    description: "Grab this classic iPad 1st Generation! Lightly used and well-maintained, it’s perfect for browsing,
    reading, or basic apps. A great deal for those who appreciate tech history or need a simple tablet.",
    image_url: "https://i.ebayimg.com/images/g/lQgAAOSwdHlfzDDg/s-l1600.jpg",
    condition: "refurbished",
    price: 40
  },

  {
    title: "Personal Styling",
    user_id: alex.id,
    category_id: services.id,
    description: "Trying swipe services? Upgrade your style with personalized flair! Offering expert personal styling
    to elevate your look and confidence. Let's redefine your wardrobe together!",
    image_url: "https://images.squarespace-cdn.com/content/v1/5f21b3c0862b9f38f883a002/7934ef35-cdd7-4681-a72d-924094eee139/Men%27s+before+and+after+transformation-will.jpg",
    condition: "refurbished",
    price: 85
  },

  {
    title: "Gameboy color",
    user_id: alex.id,
    category_id: electronics.id,
    description: "Relive the nostalgia with this Game Boy Color! Lightly used and well-maintained, it’s perfect for
    classic gaming fun. A great addition for collectors or anyone looking to enjoy retro games. Don't miss out on this
    timeless piece!",
    image_url: "https://media.karousell.com/media/photos/products/2021/1/31/nintendo_gameboy_color__5_game_1612066440_2e34574e_progressive.jpg",
    condition: "used",
    price: 110
  },

  {
    title: "Fire ant colony",
    user_id: remi.id,
    category_id: others.id,
    description: "Fire ants are small, aggressive ants known for their painful stings. They are reddish-brown in color
    and are commonly found in warm climates.",
    image_url: "https://www.extermpro.com/wp-content/uploads/2019/02/fire-ants.jpg",
    condition: "new",
    price: 15
  },

  {
    title: "Origami book",
    user_id: remi.id,
    category_id: toys_games.id,
    description: "Discover the magic of origami with this amazing used book! Perfect for beginners or enthusiasts,
    it's filled with captivating designs and easy-to-follow instructions. ",
    image_url: "https://m.media-amazon.com/images/I/71cLZioN1pL._AC_UF894,1000_QL80_.jpg",
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
    title: "High Protein Chocolate Chip Cookies",
    user_id: remi.id,
    category_id: sport_wellness.id,
    description: "Homemade chocolate chip cookies with high protein levels, freshly baked with high-quality ingredients, including real butter
    and semi-sweet chocolate chips. Get big or get home!",
    image_url: "https://i.etsystatic.com/21530912/r/il/64056b/2451976559/il_fullxfull.2451976559_2dpt.jpg",
    condition: "new",
    price: 10
  },

  {
    title: "Half Used Honey",
    user_id: remi.id,
    category_id: sport_wellness.id,
    description: "A jar of organic wildflower honey, half-used, with a rich, floral flavor. Perfect for sweetening tea
    or spreading on toast.",
    image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/honey-pot-4d7c98d.jpg",
    condition: "new",
    price: 1
  },

  {
    title: "SUPREME Morrisey",
    user_id: tuo.id,
    category_id: clothing.id,
    description: "Introducing the Supreme Morrissey T-shirt, gently used and full of style. Embrace iconic fashion with
    this pre-loved tee, perfect for fans of both Supreme and Morrissey. Add a touch of streetwear flair to your wardrobe
     today.",
    image_url: "https://soledoutjc.com/cdn/shop/products/610b7fb7f0aca43995c6b13bd10ad1ea.jpg",
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
    title: "Nike Alpha Fly",
    user_id: tuo.id,
    category_id: clothing.id,
    description: "Step into elite performance with our gently used Nike Alpha Fly sneakers. These shoes have been
    crafted for speed and comfort, making them ideal for runners of all levels.
    Elevate your runs with the quality and innovation of Nike.",
    image_url: "https://www.languagebird.com/wp-content/uploads/2021/06/Mandarin-Language-e1629327465771.jpg",
    condition: "used",
    price: 300
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
    title: "Ikea used chair",
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
    title: "Sri Lankan Chatties",
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

]


products.each_with_index do |product, index|
  if product[:image_url].present?
    file = URI.open(product[:image_url])
    product.delete(:image_url)
    new_product = Product.new(product)
    new_product.photo.attach(io: file, filename: "image#{index}.png", content_type: "image/png")
    new_product.save
  else
    new_product = Product.new(product)
    new_product.save
  end
end
