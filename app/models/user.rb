class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rentals
  has_many :items, through: :rentals
  validates :username, :first_name, :last_name, :email, :address, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
end
