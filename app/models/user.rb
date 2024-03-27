class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :favoris
  has_many :purchases
  has_many :games, through: :offers

  has_one_attached :photo

  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
