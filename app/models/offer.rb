class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many_attached :photos

  validates :box_condition, presence: true
  validates :cover_condition, presence: true
  validates :manual_condition, presence: true
  validates :media_condition, presence: true
  validates :game_id, uniqueness: { scope: :user_id, message: "Vous avez déjà ce jeu dans votre collection." }

  GRADES = [
    ['Très bon état', 'A'],
    ['Bon état', 'B'],
    ['Mauvais état', 'C'],
    ['Absent', 'Z']
  ]
end
