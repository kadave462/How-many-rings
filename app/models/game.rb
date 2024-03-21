class Game < ApplicationRecord
  has_many :offers

  validates :title, uniqueness: { scope: :platform, message: "Ce jeu existe déjà sur cette console." }
end
