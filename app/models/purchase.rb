class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :owned_game
  has_many :games, through: :owned_games
end
