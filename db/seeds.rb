# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create five users
puts "Destroying all orders..."
Order.destroy_all
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
  puts "User #{user.id} created"
end


# Create ten yarns
10.times do
  yarn = Yarn.create!(
    name: Faker::Commerce.product_name,
    color: Faker::Color.color_name,
    price: Faker::Commerce.price,
    weight: ['Lace', 'Fingering', 'Sock', 'Sport', 'DK', 'Worsted', 'Aran', 'Chunky',
             'Super Chunky', 'Bulky', 'Jumbo', 'Other'].sample,
    brand: "Knitting for Olive",
    address: ['5 Av. Anatole France, Paris', '16 Villa Gaudelet, Paris', '15 Pl. Vendôme, Paris',
              '35 Rue du Chevalier de la Barre, Paris', '82 Bd de Clichy, Paris'].sample,
    quantity: 3,
    material: Faker::Commerce.material,
    user_id: User.all.sample.id,
  )
  yarn.photos.attach(io: File.open(File.join(Rails.root,'app/assets/images/IMG_5036 Medium.png')),
                     filename: 'yarn2.png')
  puts "Yarn #{yarn.id} created"
end
