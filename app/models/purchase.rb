class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :games, W: :offers
end
