require 'faker'
Faker::Config.locale = 'en-US'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, organization: Faker::Company.name, address: Faker::Address.street_address, apt:'', city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, email: Faker::Internet.email, phone: '555-555-5555', dob: Faker::Date.birthday(18, 65), gender: 'm', password: 'aaaa')
end

Event.create!({name: "Cherokee Park Clean Up", start_date: "2017-12-13", end_date: "2017-12-13", start_time: '14:00:00', end_time: '16:00:00', location1: "Cherokee Park", location2: "Top of the hill", city: "Louisville", state: 'Louisville', zip: "40202", details: "Join us as we take part in the Mayor's Annual Give-A-Day week by helping to clean up in the park! Dress for the cold!!"})

Event.create!({name: "Food Drive for Rohingya Refugees", start_date: "2017-12-10", end_date: "2017-12-31", start_time: '12:00:00', end_time: '12:00:00', location1: "MAC Office", location2: "2903 Waldoah Beach Rd.", city: "Louisville", state: 'Louisville', zip: "40207", details: "The Rohingya refugee community has faced a lot of challenges in making Louisville their new home. We are collecting canned goods and other non-perishables on their behalf, so as to ease their burden a bit. Please drop items at our office by the 31st so that we may deliver at the start of the new year."})

Event.create!({name: "Shawnee Park Clean Up", start_date: "2017-12-20", end_date: "2017-12-20", start_time: '14:00:00', end_time: '16:00:00', location1: "Shawnee Park", location2: "By the Barn!", city: "Louisville", state: 'Louisville', zip: "40202", details: "Join us as we take part in the Mayor's Annual Give-A-Day week by helping to clean up in the park! Dress for the cold!!"})

100.times do
  Event.create!(name: Faker::Job.key_skill, start_date: Faker::Date.forward(100), end_date: Faker::Date.forward(200), start_time: '14:00:00', end_time: '16:00:00', location1: Faker::Company.name, location2: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, details: Faker::Hobbit.quote)
end

100.times do
  Post.create!(title: Faker::Movie.quote, content: Faker::HitchhikersGuideToTheGalaxy.quote, event_id: Faker::Number.between(1, 100), user_id: Faker::Number.between(1, 100))
end
