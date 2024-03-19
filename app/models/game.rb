class Game < ApplicationRecord
  has_many :offers

  validates :title, uniqueness: { scope: :platform, message: "This game already exists on the platform." }
end
