# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

wishes = 20.times do
  @wish = Wish.new
  @wish.title = Faker::Lorem.sentence
  @wish.description = Faker::Lorem.paragraph(rand(1..10))
  @location = @wish.build_location
  @location.address = "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}"
  @location.latitude = Faker::Address.latitude
  @location.longitude = Faker::Address.longitude
  @skill = @wish.skills.new
  @skill.name = Faker::Name.title
  @tool = @wish.tools.new
  @tool.name = Faker::Hacker.noun
  @wish.save
end
