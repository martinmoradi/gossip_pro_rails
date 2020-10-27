# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "activerecord-reset-pk-sequence"

User.delete_all
User.reset_pk_sequence
City.delete_all
City.reset_pk_sequence
Tag.delete_all
Tag.reset_pk_sequence
Gossip.delete_all
Gossip.reset_pk_sequence
TagAssignment.delete_all
TagAssignment.reset_pk_sequence

10.times do

  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
  
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.free_email,
    age: Faker::Number.between(8..90),
    city_id: City.ids.sample
  )
  Tag.create!(
    title: "##{Faker::Cannabis.strain}"
  )
end

20.times do
  Gossip.create!(
    title: Faker::Company.bs,
    content: Faker::Lorem.paragraph,
    user_id: User.ids.sample
  )
end

Gossip.ids.each do |id|
  rand(1..5).times do
    TagAssignment.create!(
      gossip_id: id,
      tag_id: Tag.all.sample.id
  )
  end
end
