# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create five users
require 'open-uri'

puts "Destroying all users..."
User.destroy_all
puts "Destroying all yarns..."
Yarn.destroy_all

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    password: Faker::Internet.password
  )

  image = URI.open(
    ["https://images.unsplash.com/photo-1628157588553-5eeea00af15c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YXZhdGFyLHBob3RvfHx8fHx8MTY2Nzg0NTIxMg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
     "https://images.unsplash.com/photo-1542200843-f8ee535b631f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YXZhdGFyLHBob3RvfHx8fHx8MTY2Nzg0NTgyNw&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
     "https://images.unsplash.com/photo-1529589574731-3c3eb55d8b76?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YXZhdGFyLHBob3RvfHx8fHx8MTY2Nzg0NTg1MA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
     "https://images.unsplash.com/photo-1623582854588-d60de57fa33f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YXZhdGFyLHBob3RvfHx8fHx8MTY2Nzg0NTg3NA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
     "https://images.unsplash.com/photo-1607746882042-944635dfe10e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YXZhdGFyLHBob3RvfHx8fHx8MTY2Nzg0NTkyMA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080"].sample
  )
  user.photo.attach(io: image, filename: "profile_photo#{user.id}", content_type: "image/png")
  puts "User #{user.id} created"
end


# Create ten yarns
10.times do
  yarn = Yarn.new(
    name: ['Gorgeous Skeins', 'Bundle of Yarn', 'Wound All-Natural Yarn', 'Organic Skeins',
           'Hand-Dyed Yarns', 'Beautiful Bundles', 'Fluffy Yarn'].sample,
    color: Faker::Color.color_name,
    price: rand(10..50) * 100,
    weight: ['Lace', 'Fingering', 'Sock', 'Sport', 'DK', 'Worsted', 'Aran', 'Chunky',
             'Super Chunky', 'Bulky', 'Jumbo', 'Other'].sample,
    brand: ['Adriafil', 'Austermann', 'BC Garn', 'Bergere de France', 'Berroco', 'Caron',
            'Cascade Yarns', 'DMC', 'Debbie Bliss', 'Drops', 'Istex', 'ITO', 'Katia',
            'Knitting for Olive', 'Lana Grossa', 'Lang Yarns', 'Lion Brand', 'Malabrigo',
            'Noro', 'Novita', 'Phildar', 'Rico', 'Rowan', 'Schachenmayr', 'Scheepjes',
            'The Fibre Co.', 'Life in the Long Grass', 'Hobbii', 'Other'].sample,
    address: ['5 Av. Anatole France, Paris', '16 Villa Gaudelet, Paris', '15 Pl. Vendôme, Paris',
              '35 Rue du Chevalier de la Barre, Paris', '82 Bd de Clichy, Paris'].sample,
    quantity: rand(1..10),
    material: ['Acrylic', 'Alpaca', 'Angora', 'Bamboo', 'Cashmere', 'Cotton', 'Linen', 'Merino',
               'Mohair', 'Polyester', 'Silk', 'Wool', 'Other'].sample,
    description: ["I haven't found a use for this yarn and would like to sell it to someone else. It's quite beautiful and in mint condition!",
                  "These skeins of yarn are now quite rare. You can use them to knit a garment or a cute accessory like a purse.",
                  "It's hard to give these up, but there's not sense in keeping something you aren't going to use. These beautiful skeins were meant for a
                   scarf, but I'm sure someone will find a better use for them!", "I want to sell this quickly. First come, first served!"].sample,
    user_id: User.all.sample.id
  )
  yarn.photos.attach(io: File.open(File.join(Rails.root,
                    ['app/assets/images/IMG_5036 Medium.png', 'app/assets/images/IMG_5038 Medium.png',
                     'app/assets/images/IMG_5045 Medium.png', 'app/assets/images/IMG_5070 Medium.png',
                     'app/assets/images/IMG_5072 Medium.png', 'app/assets/images/IMG_5077 Medium.png'].sample)),
                     filename: "product#{yarn.id}.png")
  yarn.save
  puts "Yarn #{yarn.id} created"
end
