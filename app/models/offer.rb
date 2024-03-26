class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many_attached :photos
  has_many :favoris
  has_many :messages


  validates :box_condition, presence: true
  validates :cover_condition, presence: true
  validates :manual_condition, presence: true
  validates :media_condition, presence: true
  # validates :description, presence: true
  # validates :game_id, uniqueness: { scope: :user_id, message: "Vous avez déjà ce jeu dans votre collection." }

  CONDITIONS = ['Très bon état', 'Bon état', 'Mauvais état', 'Absent']
end
