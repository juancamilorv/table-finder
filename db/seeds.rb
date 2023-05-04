# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Reservation.destroy_all
Restaurant.destroy_all
User.destroy_all
puts 'Deleting records from the DB...'

User.create(name: 'Client', email: 'client@email.com', password: '123456', password_confirmation: '123456', hoster: false)
hoster1 = User.create(name: 'Hoster1', email: 'hoster1@email.com', password: '123456', password_confirmation: '123456', hoster: true)
hoster2 = User.create(name: 'Hoster2', email: 'hoster2@email.com', password: '123456', password_confirmation: '123456', hoster: true)

(1..3).each do |num|
  restaurant = Restaurant.new
  restaurant.user = hoster1
  restaurant.name = "Testing name#{num}"
  restaurant.description = "Testing description#{num}"
  restaurant.address = "Testing address#{num}"
  restaurant.city = "Testing city#{num}"

  restaurant.photo.attach(io: URI.open('https://res.cloudinary.com/dpcj8gyeu/image/upload/v1683052000/dining-restaurants-1057448_nvu8j8.jpg'),
                          filename: 'restaurant.png',
                          content_type: 'image/png')

  restaurant.save!
end

(4..6).each do |num|
  restaurant = Restaurant.new
  restaurant.user = hoster2
  restaurant.name = "Testing name#{num}"
  restaurant.description = "Testing description#{num}"
  restaurant.address = "Testing address#{num}"
  restaurant.city = "Testing city#{num}"

  restaurant.photo.attach(io: URI.open('https://res.cloudinary.com/dpcj8gyeu/image/upload/v1683052000/dining-restaurants-1057448_nvu8j8.jpg'),
                          filename: 'restaurant.png',
                          content_type: 'image/png')

  restaurant.save!
end
