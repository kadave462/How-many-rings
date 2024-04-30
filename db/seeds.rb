# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Favori.destroy_all
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


Game.create!(
  title: "Yoshi's Story",
  release_year: 1997,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co260t.png',
  genre: 'Plate-forme',
  platform: 'Nintendo 64',
  publisher: 'Nintendo',
  average_price: 80
)

Game.create!(
  title: "Halo 2",
  release_year: 2004,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1x77.png',
  genre: 'Shooter',
  platform: 'Xbox',
  publisher: 'Bungie',
  average_price: 50
)

Game.create!(
  title: "Skies of Arcadia",
  release_year: 2000,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2ojm.png',
  genre: 'RPG',
  platform: 'Dreamcast',
  publisher: 'SEGA',
  average_price: 50
)

Game.create!(
  title: "Max Payne",
  release_year: 2001,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3wb2.png',
  genre: 'Shooter',
  platform: 'PC',
  publisher: 'Rockstar Games',
  average_price: 10
)

Game.create!(
  title: "Les Sims 4",
  release_year: 2017,
  description: '',
  cover: 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3h3l.png',
  genre: 'Simulateur',
  platform: 'PlayStation 4',
  publisher: 'Electronic Arts',
  average_price: 10
)

user1 = User.create!(
  username: 'JuJu',
  email: 'julien@email.com',
  password: 'julien'
)

user2 = User.create!(
  username: 'John',
  email: 'jonathan@email.com',
  password: 'jonathan'
)

user3 = User.create!(
  username: 'David',
  email: 'david@email.com',
  password: 'davidk'
)

user4 = User.create!(
  username: 'Jean Loup',
  email: 'jean@email.com',
  password: 'jeannot'
)

user5 = User.create!(
  username: 'Antoine',
  email: 'antoine@email.com',
  password: 'antoine'
)

20.times do
  username = Faker::Name.first_name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 8)

  User.create!(
    username: username,
    email: email,
    password: password
  )
end

users_ids = []
User.find_each do |user|
  users_ids << user.id
end

descriptions = [
  "Comme neuf, joué une fois, aucun défaut visible.",
  "Quelques égratignures sur le disque, mais fonctionne parfaitement.",
  "Boîtier légèrement endommagé, mais le disque est en bon état.",
  "Manuel manquant, mais la boîte et le disque sont en excellent état.",
  "Quelques marques d'usure sur le boîtier, mais le disque est impeccable.",
  "Disque rayé mais jouable sans problème, boîtier en bon état.",
  "Tout est en excellent état, comme neuf, jamais utilisé.",
  "Boîtier légèrement fissuré, mais le disque fonctionne parfaitement.",
  "Manuel inclus, mais boîte et disque montrent des signes d'usure.",
  "Disque en bon état, boîtier avec quelques égratignures mineures.",
  "Complet avec manuel et boîte, légères marques d'utilisation.",
  "Usure légère sur le boîtier, mais le disque est en bon état."
]

etat = ['Absent', 'Bon état', 'Très bon état', 'Mauvais état' ]

Game.find_each do |game|
  rand(3..4).times do
    Offer.create!(
      user_id: users_ids.sample,
      game_id: game.id,
      on_sale: true,
      description: descriptions.sample,
      price: rand(20..200),
      media_condition: etat.sample,
      cover_condition: etat.sample,
      box_condition: etat.sample,
      manual_condition: etat.sample
    )
  end
end

# offer1 = Offer.create!(
#   user_id: user1.id,
#   game_id: game5.id,
#   on_sale: true,
#   description: 'Notice absente, boîte pas ouf',
#   price: 150,
#   media_condition: 'Bon état',
#   cover_condition: 'Très bon état',
#   box_condition: 'Très bon état',
#   manual_condition: 'Absent'
# )

# offer2 = Offer.create!(
#   user_id: user1.id,
#   game_id: game2.id,
#   on_sale: true,
#   description: 'Notice abimée',
#   price: 130,
#   media_condition: 'Très bon état',
#   cover_condition: 'Bon état',
#   box_condition: 'Très bon état',
#   manual_condition: 'Mauvais état'
# )

# offer3 = Offer.create!(
#   user_id: user2.id,
#   game_id: game1.id,
#   on_sale: true,
#   description: 'Pas de jaquette',
#   price: 25,
#   media_condition: 'Mauvais état',
#   cover_condition: 'Absent',
#   box_condition: 'Bon état',
#   manual_condition: 'Très bon état'
# )

# offer4 = Offer.create!(
#   user_id: user3.id,
#   game_id: game4.id,
#   on_sale: true,
#   description: 'Bon état général',
#   price: 55,
#   media_condition: 'Bon état',
#   cover_condition: 'Très bon état',
#   box_condition: 'Très bon état',
#   manual_condition: 'Mauvais état'
# )

# offer5 = Offer.create!(
#   user_id: user2.id,
#   game_id: game3.id,
#   on_sale: true,
#   description: 'Jeu abîmé mais le reste est nickel',
#   price: 65,
#   media_condition: 'Mauvais état',
#   cover_condition: 'Très bon état',
#   box_condition: 'Très bon état',
#   manual_condition: 'Bon état'
# )

Favori.create!(
  user_id: user2.id,
  game_id: game3.id
)

Favori.create!(
  user_id: user2.id,
  game_id: game5.id
)

Favori.create!(
  user_id: user1.id,
  game_id: game2.id
)

Favori.create!(
  user_id: user3.id,
  game_id: game3.id
)


puts 'Seeds OK.'
