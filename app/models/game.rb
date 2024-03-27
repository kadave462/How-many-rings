class Game < ApplicationRecord
  has_many :offers
  has_many :favoris

  validates :title, uniqueness: { scope: :platform, message: "Ce jeu existe déjà sur cette console." }
end
