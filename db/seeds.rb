# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Booking.destroy_all
Restaurant.destroy_all
User.destroy_all
user = User.create!(email: 'test@test.com', password: '123456', role: 'owner')
10.times do
  puts user
  Restaurant.create!({name: 'Dishoom', category: 'Indian', address: '5 Stable Street London N1C 4AB',
                  rating: 5, phone_number: '020 7420 9321', menu: 'Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.',
                  description: 'EGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?',
                  price_range: 2, capacity: 500, user: user})
end
