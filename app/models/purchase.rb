class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :games, through: :offers
end
