# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Wish.destroy_all

wishes = 50.times do
  @user = User.new
  @user.username = Faker::Internet.user_name
  @user.email = Faker::Internet.email
  @user.password = "password"
  @user.password_confirmation = "password"
  @user.save

  @wish = @user.wishes.new
  @wish.title = Faker::Lorem.sentence
  @wish.description = Faker::Lorem.paragraph(rand(1..10))

  @location = @wish.build_location
  faker_address = Faker::Address
  @location.address = "#{faker_address.street_address}, #{faker_address.city}, #{faker_address.country}"
  @location.latitude = faker_address.latitude
  @location.longitude = faker_address.longitude

  @skill = @wish.skills.new
  @skill.name = Faker::Name.title

  @tool = @wish.tools.new
  @tool.name = Faker::Hacker.noun

  @wish.save

  @wish.images.create(photo: File.new("public/images/seed.png"))
end
