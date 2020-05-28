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

User.create(email: "guest@test.com", password: "123456", role: "guest")
User.create(email: "owner@test.com", password: "123456", role: "owner")
5.times do
  restaurant = Restaurant.new(category: ['Indian','Chinese', 'British', 'Arabic'].sample, user: User.first, name: Faker::Restaurant.name , opening_time: 'Lunch, Happy Hour, Dinner', address: "Gatehouse Ln, Goddards Green, Hassocks BN6 9LE", rating: 3, phone_number: '0208 12345678', capacity: 12, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
  file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
  restaurant.photos.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save
  restaurant = Restaurant.new(category: ['Indian', 'Chinese', 'British', 'Arabic'].sample, user: User.first, name: Faker::Restaurant.name , opening_time: 'Lunch, Happy Hour, Dinner', address: "Butler's Green Rd, Ha names Heath RH16 4BE", rating: 3, phone_number: '0208 12345678', capacity: 12, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
  file = URI.open('https://images.unsplash.com/photo-1559925393-8be0ec4767c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80')
  restaurant.photos.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save
end


5.times do
  Booking.create(date: Date.new(2020,6,1), time:'Lunch', accepted: false, party: 3, user: User.first, restaurant: Restaurant.first)
  Booking.create(date: Date.new(2020,6,2), time:'Dinner', accepted: true, party: 3, user: User.first, restaurant: Restaurant.first)
  Booking.create(date: Date.new(2020,6,3), time:'Lunch', accepted: false, party: 3, user: User.first, restaurant: Restaurant.last)
end
# restaurant = Restaurant.new(category: 'Italian', user: User.first, name: 'Barnsley', address: "Nevill Ave, Hove BN3 7HY", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://www.stiegelmeyer.com/fileadmin/_processed_/5/8/csm_9264_Evario_Intercontinental_45Grad_Model_2016_12_001_fein-01_44a3111076.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Italian', user: User.first, name: 'Romeo', address: "Martyrs Ave, Crawley RH11 7EJ", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open("https://img.medicalexpo.com/images_me/photo-g/68959-13682725.jpg")
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Chineese', user: User.first, name: 'Elizabeth', address: "14-18 New Church Rd, Hove BN3 4FH", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://blog.arjo.com/hs-fs/hubfs/Citadel_nurse_reposition.jpg?width=943&name=Citadel_nurse_reposition.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Chineese', user: User.first, name: 'George', address: "61A Cromwell Ave, Highgate, London N6 5HP", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://blog.arjo.com/hs-fs/hubfs/Citadel_nurse_reposition.jpg?width=943&name=Citadel_nurse_reposition.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Chineese', user: User.first, name: 'George', address: "61A Cromwell Ave, Highgate, London N6 5HP", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://blog.arjo.com/hs-fs/hubfs/Citadel_nurse_reposition.jpg?width=943&name=Citadel_nurse_reposition.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Chineese', user: User.first, name: 'George', address: "61A Cromwell Ave, Highgate, London N6 5HP", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://blog.arjo.com/hs-fs/hubfs/Citadel_nurse_reposition.jpg?width=943&name=Citadel_nurse_reposition.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
# restaurant = Restaurant.new(category: 'Chineese', user: User.first, name: 'George', address: "61A Cromwell Ave, Highgate, London N6 5HP", rating: 3, phone_number: '0208 12345678', capacity: 20, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
# file = URI.open('https://blog.arjo.com/hs-fs/hubfs/Citadel_nurse_reposition.jpg?width=943&name=Citadel_nurse_reposition.jpg')
# restaurant.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
# restaurant.save
