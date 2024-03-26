class Favori < ApplicationRecord
  belongs_to :user
  belongs_to :game

  # validates :user_id, uniqueness: { scope: :game_id, message: "Vous avez deja cette favori" }
end
