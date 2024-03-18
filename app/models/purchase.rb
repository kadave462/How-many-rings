class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :owned_game
end
