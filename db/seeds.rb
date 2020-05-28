# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Review.destroy_all
# Booking.destroy_all
# Restaurant.destroy_all
# User.destroy_all
# user = User.create!(email: 'test@test.com', password: '123456', role: 'owner')
# 10.times do
#   puts user
#   Restaurant.create!({name: 'Dishoom', category: 'Indian', address: '5 Stable Street London N1C 4AB',
#                   rating: 5, phone_number: '020 7420 9321', menu: 'Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.',
#                   description: 'EGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?',
#                   price_range: 2, capacity: 500, user: user})
# end


require "open-uri"
require 'faker'

Review.destroy_all
Booking.destroy_all
Restaurant.destroy_all
User.destroy_all

guest = User.new(name: 'Fred “The Foodie” Flinstone', email: "guest@test.com", password: "123456", role: "guest", rating: 3.5)
file = URI.open('https://66.media.tumblr.com/382476e2affeafa41e46411c885a48eb/fb8e38c4f3555302-3d/s1280x1920/f79bd443fcce1f82ecc7c8deaa4e379ab15b453f.jpg')
guest.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
guest.save

owner = User.new(name: 'OWOWOWNNER', email: "owner@test.com", password: "123456", role: "owner", rating: 3.5)
file = URI.open('https://i.guim.co.uk/img/media/ff3eaa5dd00f096d763630264d8fbddde0ad5f11/72_0_1319_792/master/1319.jpg?width=1200&quality=85&auto=format&fit=max&s=d4c1ec9fd6496525dab974b6fe8153ef')
owner.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
owner.save

url1 = 'https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
url2 = 'https://images.unsplash.com/photo-1528605248644-14dd04022da1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
url3 = 'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'
url4 = 'https://images.unsplash.com/photo-1551632436-cbf8dd35adfa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'
url5 = 'https://images.unsplash.com/photo-1522336572468-97b06e8ef143?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1355&q=80'
urls = [url1, url2, url3, url4, url5]

5.times do
  image_url = urls.sample
  restaurant = Restaurant.new(category: ['Indian', 'Chinese', 'British', 'Arabic', 'Japanese'].sample, user: User.second, name: Faker::Restaurant.name , opening_time: 'Lunch, Happy Hour, Dinner', address: "Gatehouse Ln, Goddards Green, Hassocks BN6 9LE", rating: rand(1..10)/2.0, phone_number: '0208 12345678', capacity: 12, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
  restaurant.photos.attach(io: URI.open(image_url), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save
  image_url = urls.sample
  restaurant = Restaurant.new(category: ['Indian', 'Chinese', 'British', 'Arabic', 'Japanese'].sample, user: User.second, name: Faker::Restaurant.name , opening_time: 'Lunch, Happy Hour, Dinner', address: "Butler's Green Rd, Ha names Heath RH16 4BE", rating: rand(1..10)/2.0, phone_number: '0208 12345678', capacity: 12, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
  restaurant.photos.attach(io: URI.open(image_url), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save
end

15.times do
  Booking.create(date: Date.new(2020,5,rand(15..28)), time:'Lunch', accepted: true, party: 3, user: User.first, restaurant: Restaurant.all.sample)
  Booking.create(date: Date.new(2020,6,rand(10..25)), time:'Dinner', accepted: [true, false].sample, party: 3, user: User.first, restaurant: Restaurant.all.sample)
  Booking.create(date: Date.new(2020,6,rand(10..25)), time:'Lunch', accepted: [true, false].sample, party: 3, user: User.first, restaurant: Restaurant.all.sample)
end
