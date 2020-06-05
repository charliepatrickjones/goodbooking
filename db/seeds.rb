require "open-uri"
require 'faker'

Review.destroy_all
Booking.destroy_all
Restaurant.destroy_all
User.destroy_all

p_guest = User.new(name: 'Samantha Jones', email: "guest@test.com", password: "123456", role: "guest", rating: 4.5)
file = URI.open('https://images.unsplash.com/photo-1495490140452-5a226aef25d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
p_guest.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
p_guest.save

n_guest = User.new(name: 'George Livingstone', email: "guest1@test.com", password: "123456", role: "guest", rating: 1.0)
file = URI.open('https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=515&q=80')
n_guest.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
n_guest.save

guests = [p_guest, n_guest]

owner = User.new(name: 'Francesco Gardner', email: "owner@test.com", password: "123456", role: "owner", rating: 3.5)
file = URI.open('https://i.guim.co.uk/img/media/ff3eaa5dd00f096d763630264d8fbddde0ad5f11/72_0_1319_792/master/1319.jpg?width=1200&quality=85&auto=format&fit=max&s=d4c1ec9fd6496525dab974b6fe8153ef')
owner.photo.attach(io: file, filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
owner.save

url1 = 'https://images.prismic.io/dishoom/8ff2cea4fdb751bae5f8f72c8cbd6f9f63c9761b_dishoom-kings-cross.jpg?auto=compress,format'
url2 = 'https://images.prismic.io/dishoom/23d8c6aa983bd92d0dc9f0ff5d880368d7a4cfab_kings-cross.jpg?auto=compress,format'
url3 = 'https://media.timeout.com/images/103510877/630/472/image.jpg'
url4 = 'https://images.squaremeal.co.uk/cloud/event-party-venues/3500/1612_bao-fitzrovia_10.jpg?w=900&h=600&fit=crop'
url5 = 'https://www.we-heart.com/upload-images/kilnsoholondon1@2x.jpg'
url6 = 'https://cdn-b.william-reed.com/var/wrbm_gb_hospitality/storage/images/publications/hospitality/bighospitality.co.uk/article/2018/06/11/soho-s-kiln-named-best-restaurant-in-the-uk/2843516-1-eng-GB/Soho-s-Kiln-named-Best-Restaurant-in-the-UK_wrbm_large.png'
url7 = 'https://media.timeout.com/images/103003212/image.jpg'
url8 = 'https://cdn-b.william-reed.com/var/wrbm_gb_hospitality/storage/images/publications/hospitality/bighospitality.co.uk/article/2020/02/26/latest-opening-for-jks-restaurants-hoppers-third-site-in-london-s-king-s-cross/3291169-1-eng-GB/Latest-opening-for-JKS-Restaurants-Hoppers-third-site-in-London-s-King-s-Cross_wrbm_large.jpg'
url9 = 'https://media-cdn.tripadvisor.com/media/photo-s/12/ef/f8/b4/morning-buzz.jpg'
url10 = 'https://media.timeout.com/images/104828760/630/472/image.jpg'
url11 = 'https://media.timeout.com/images/105152828/630/472/image.jpg'
url12 = 'https://media.timeout.com/images/105152826/image.jpg'
url13 = 'https://thenudge.com/wp-content/uploads/1970/01/Barrafina_DeanStreet.jpg'
url14 = 'https://www.hot-dinners.com/images/stories/blog/2018/barrafinacoal/counter.jpg'
url15 = 'https://media.timeout.com/images/105227872/630/472/image.jpg'
url16 = 'https://media.timeout.com/images/103720736/image.jpg'


  restaurant = Restaurant.new(category:'Indian', user: owner, name: 'Dishoom' , opening_time: 'Lunch, Happy Hour, Dinner', address: "5 Stable St, Kings Cross, London N1C 4AB", rating: 4, phone_number: '020 7420 9321', capacity: 100, price_range: 45, description: "BEGIN YOUR DAY AT DISHOOM with breakfast, which might be a Bacon Naan Roll, a Kejriwal or a Big Bombay. Then lunch lightly on Roomali Rolls and Salad Plates, or linger with a feast. Refresh your afternoon with a drop of Chai and a small plate or two. Dine early or dine late. Or just join us for a tipple – perhaps an East India Gimlet, a Viceroy’s Old-fashioned, or our very good Dishoom IPA?", menu: "Bombay breakfast, lunch, afternoon chai, dinner and late tipples. Available for collection and delivery.")
  restaurant.photos.attach(io: URI.open(url1), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url2), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Taiwanese', user: owner, name: 'Bao' , opening_time: 'Lunch, Happy Hour, Dinner', address: "31 Windmill St, Fitzrovia, London W1T 2JN", rating: 5, phone_number: '020 3011 1632', capacity: 50, price_range: 55, description: "A townhouse over three floors in Central London, specialising in Ping Paan Platters & larger sharing dishes. All the baos are steamed in the bakery on first floor. Reservations taken.")
  restaurant.photos.attach(io: URI.open(url3), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url4), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Thai', user: owner, name: 'Kiln' , opening_time: 'Lunch, Happy Hour, Dinner', address: "58 Brewer St, Soho, London W1F 9TL", rating: 4, phone_number: '020 3011 1632', capacity: 50, price_range: 35, description: "Kiln is the brainchild of chef and restaurateur Ben Chapman, who is also behind popular Thai eatery Smoking Goat, which can be found in Shoreditch. Taking up residency on Soho’s Brewer Street, Kiln finds itself in good company alongside the likes of Randall & Aubin and El Camion. Much like its sibling, the menu here focuses on barbecue dishes cooked over open flames, championing dishes from a grill, seafood and clay pot dishes.")
  restaurant.photos.attach(io: URI.open(url5), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url6), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Sri Lankan', user: owner, name: 'Hoppers' , opening_time: 'Lunch, Happy Hour, Dinner', address: "49 Frith St, Soho, London W1D 4SG", rating: 3, phone_number: '020 3011 1632', capacity: 50, price_range: 55, description: "Hoppers Soho is inspired by Sri Lanka's village toddy shops. We serve hoppers, dosas, kothus, and roasts, complemented by a tropical drinks list which has Genever and Arrack at its heart.")
  restaurant.photos.attach(io: URI.open(url7), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url8), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Italian', user: owner, name: 'Padella' , opening_time: 'Lunch, Happy Hour, Dinner', address: "6 Southwark St, London SE1 1TQ", rating: 4, phone_number: '020 3011 1632', capacity: 50, price_range: 25, description: "Padella is the unassuming pasta restaurant that has spawned what feels like a thousand imitators since its debut in 2016, and was without doubt the catalyst for London’s fresh pasta revolution. Found right next to foodie hub Borough Market, Padella is often packed to the rafters. The restaurant doesn’t take bookings and while the advent of a ‘digital queue’ means you can head off for pre-dinner drinks, you’ll still have to wait a couple of hours for a table most nights.")
  restaurant.photos.attach(io: URI.open(url9), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url10), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Thai', user: owner, name: 'Smoking Goat' , opening_time: 'Lunch, Happy Hour, Dinner', address: "64 Shoreditch High St, Hackney, London E1 6JJ", rating: 5, phone_number: '020 3011 1632', capacity: 50, price_range: 55, description: "Cool, laid-back restaurant with quirky dishes & drinks inspired by Bangkok’s late-night canteens.")
  restaurant.photos.attach(io: URI.open(url11), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url12), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'Spanish', user: owner, name: 'Barrafina' , opening_time: 'Lunch, Happy Hour, Dinner', address: "64 Shoreditch High St, Hackney, London E1 6JJ", rating: 5, phone_number: '020 3011 1632', capacity: 100, price_range: 55, description: "The first Barrafina, on Frith Street (RIP), was the original small-plates-and-no-reservations counter bar pioneer, a template that has since gone viral. This bustling, Barcelona-style tapas joint now has branches across town, but Adelaide Street is the slightly glitzier, slightly larger venue that pays homage to the original without being a straight copycat. So there’s the same striped marble bar overlooking the kitchen, but its curved design cleverly allows for a couple more grateful bums on those burgundy leather stools.")
  restaurant.photos.attach(io: URI.open(url13), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url14), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

  restaurant = Restaurant.new(category: 'British', user: owner, name: 'Hawksmoor' , opening_time: 'Lunch, Happy Hour, Dinner', address: "11 Langley St, Covent Garden, London WC2H 9JG", rating: 5, phone_number: '020 3011 1632', capacity: 100, price_range: 55, description: "High-end steak specialist serving British dry-aged T-bone, D-rump and porterhouse, plus seafood.")
  restaurant.photos.attach(io: URI.open(url15), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.photos.attach(io: URI.open(url16), filename: 'seed-restaurant.jpg', content_type: 'image/jpg')
  restaurant.save

times = ["Lunch", "Dinner", "Happy Hour"]

30.times do
  Booking.create(date: Date.new(2020,5,rand(20..30)), time:times.sample, accepted: true, party: rand(1..8), user: guests.sample, restaurant: Restaurant.all.sample)
  Booking.create(date: Date.new(2020,6,rand(1..4)), time:times.sample, accepted: true, party: rand(1..4), user: guests.sample, restaurant: Restaurant.all.sample)
  Booking.create(date: Date.new(2020,6,rand(6..15)), time:times.sample, accepted: [true, false].sample, party: rand(1..8), user: guests.sample, restaurant: Restaurant.all.sample)
  Booking.create(date: Date.new(2020,6,rand(16..28)), time:times.sample, accepted: [true, false].sample, party: rand(1..8), user: guests.sample, restaurant: Restaurant.all.sample)
end

# 15.times do
#   Booking.create(date: Date.new(2020,5,rand(15..28)), time:'Lunch', accepted: true, party: 3, user: guests.sample, restaurant: Restaurant.all.sample)
#   Booking.create(date: Date.new(2020,6,rand(10..25)), time:'Dinner', accepted: [true, false].sample, party: 3, user: guests.sample, restaurant: Restaurant.all.sample)
#   Booking.create(date: Date.new(2020,6,rand(10..25)), time:'Lunch', accepted: [true, false].sample, party: 3, user: guests.sample, restaurant: Restaurant.all.sample)
# end

Booking.all.each do |booking|
  if booking.date < Date.today
    user = booking.user
    bool = [true, false].sample
    positive = ["Really cool booking, thanks for being so fun","What a helpful group, they were very patient when we had some problems in the kitchen", "Samantha arrived 10 minutes early and seemed to enjoy her meal, would love to have her back with her friends", "Cool booking!","Samantha was a fantastic booking, she was friendly, kind and fun!" , "We will definitely have Samantha back" , "We had so much fun serving Samantha, highly recommend her as a guest", "On time, fun and cool!","What a friendly bunch of people, i wish every booking was like this","This was a great booking, the group were so friendly and fun." , "What an amazing bunch! They were on time, polite and a delight to have in the restaurant", "WOW! what a good booking!", "Samantha was so cool and friendly, we will welcome her back into the restaurant with open arms!", "We cannot wait to have Samantha back in the restaurant! Her friends were also very nice"]
    negative = ["George was not particularly friendly to our staff","AVOID, late and rude!","George and his pals overstayed their welcome, and left the place in a mess","Not a good booking, dont recommend","George was rude and unkind to our staff","Turned up 20 minutes late with no apology wont be accepting again","George and his friend Git were a bit drunk and loud","George was a bit of a dissapointing booking!", "Not the best booking, George was late and a bit rude" , "George came along with his pals Arthur, Lucien, Alex and Ben... cor they were a bit roudy and kept us open until the early hours argueing about one of their other friends Heroku" , "Another visit from George, we really need to stop accepting his bookings" , "George was pleasent enough but turned up late"]
    if bool
      if booking.user == p_guest
        Review.create!(punctuality_rating: rand(7..10)/2.0, booking_rating: rand(7..10)/2.0, content: positive.sample, user: booking.user, booking:booking)
      else
        Review.create!(punctuality_rating: rand(1..5)/2.0, booking_rating: rand(1..5)/2.0, content: negative.sample, user: booking.user, booking:booking)
      end
    end
  end
end

