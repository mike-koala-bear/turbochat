# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

bear = User.create!(email: '55577@pm.me', password: '557712', password_confirmation: '557712', role: :admin)
rabbit = User.create!(email: '55577@protonmail.com', password: '557712', password_confirmation: '557712')

bear.joined_rooms << Room.create!(name: 'General', is_private: false)
bear.joined_rooms << Room.create!(name: 'Testing', is_private: false)
bear.joined_rooms << Room.create!(name: 'Bear Room', is_private: false)

# rabbit.joined_rooms << Room.create!(name: 'Rabbit Room', is_private: false)

User.first.avatar.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/fall_leaves.png')),
  filename: 'fall_leaves.png'
)

User.second.avatar.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/crystal.png')),
  filename: 'crystal.png'
)
