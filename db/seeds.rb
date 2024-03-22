# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Offer.destroy_all
Game.destroy_all
User.destroy_all

game1 = Game.create!(
  title: 'Grand Theft Auto V',
  release_year: 2022,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co66qs.png',
  genre: 'Action',
  platform: 'PlayStation 5',
  publisher: 'Rockstar Games',
  average_price: 30,
)

game2 = Game.create!(
  title: 'Sonic & Knuckles',
  release_year: 1994,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1ups.png',
  genre: 'Plate-forme',
  platform: 'Mega Drive',
  publisher: 'SEGA',
  average_price: 180
)

game3 = Game.create!(
  title: 'EA Sports FC 24',
  release_year: 2023,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co6qqa.png',
  genre: 'Sport',
  platform: 'Xbox Series X',
  publisher: 'Electronic Arts',
  average_price: 50
)

game4 = Game.create!(
  title: 'Gran Turismo',
  release_year: 1997,
  description: 'blank description for david',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co6e10.png',
  genre: 'Course',
  platform: 'PlayStation',
  publisher: 'Sony',
  average_price: 40
)

game5 = Game.create!(
  title: 'The Legend of Zelda : Ocarina of Time',
  release_year: 1998,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3nnx.png',
  genre: 'Aventure',
  platform: 'Nintendo 64',
  publisher: 'Nintendo',
  average_price: 200

)

user1 = User.create!(
  username: 'JuJu',
  email: 'julien@email.com',
  password: 'julien'
)

user2 = User.create!(
  username: 'john',
  email: 'jonathan@email.com',
  password: 'jonathan'
)

user3 = User.create!(
  username: 'david',
  email: 'david@email.com',
  password: 'davidk'
)

Offer.create!(
  user_id: user1.id,
  game_id: game5.id,
  on_sale: true,
  description: 'Notice absente',
  price: 150,
  media_condition: 'B',
  cover_condition: 'A',
  box_condition: 'A',
  manual_condition: 'Z'
)

Offer.create!(
  user_id: user1.id,
  game_id: game2.id,
  on_sale: true,
  description: 'Notice abimée',
  price: 130,
  media_condition: 'A',
  cover_condition: 'B',
  box_condition: 'A',
  manual_condition: 'C'
)

Offer.create!(
  user_id: user2.id,
  game_id: game1.id,
  on_sale: true,
  description: 'Pas de jaquette',
  price: 25,
  media_condition: 'C',
  cover_condition: 'Z',
  box_condition: 'B',
  manual_condition: 'A'
)

Offer.create!(
  user_id: user3.id,
  game_id: game4.id,
  on_sale: true,
  description: 'Bon état général',
  price: 55,
  media_condition: 'B',
  cover_condition: 'A',
  box_condition: 'A',
  manual_condition: 'C'
)

Offer.create!(
  user_id: user2.id,
  game_id: game3.id,
  on_sale: true,
  description: 'Jeu abîmé mais reste nickel',
  price: 65,
  media_condition: 'C',
  cover_condition: 'A',
  box_condition: 'A',
  manual_condition: 'B'
)
puts 'Seeds OK.'
