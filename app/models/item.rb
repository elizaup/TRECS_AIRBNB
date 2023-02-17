class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :users, through: :rentals

  validates :name, :price, :condition, :brand, :category, presence: true
end
