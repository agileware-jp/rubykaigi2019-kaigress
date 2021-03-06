# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.teams.keys.each do |team|
  users = Array.new(20) { |n| User.create(nickname: "#{team}-#{n}", team: team) }

  # cache
  all_users = User.all

  200.times do
    users.sample.connect_to(all_users.sample)
  end
end
