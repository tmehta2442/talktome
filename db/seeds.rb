# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "testing@akqa.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Tejas Mehta",
             email: "tejas.mehta@akqa.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Dennis Charles",
             email: "dennis.charles@akqa.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Dan Draper",
             email: "dan@draper.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
TimeSlot.create!(hour: 9)
TimeSlot.create!(hour: 10)
TimeSlot.create!(hour: 11)
TimeSlot.create!(hour: 12)
TimeSlot.create!(hour: 13)
TimeSlot.create!(hour: 14)
TimeSlot.create!(hour: 15)
TimeSlot.create!(hour: 16)
TimeSlot.create!(hour: 17)
TimeSlot.create!(hour: 18)

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@akqa.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end