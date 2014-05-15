# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
suckr = ImageSuckr::GoogleSuckr.new
#Post.destroy_all
10.times do |n|
  picture = suckr.get_image_file
  Post.create(title: Faker::Name.title, description: Faker::Lorem.paragraph, picture: picture, accepted: true)
end
