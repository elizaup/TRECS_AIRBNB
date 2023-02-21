class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :users, through: :rentals
  has_many_attached :photos
  validates :name, :price, :condition, :brand, :category, presence: true
end
