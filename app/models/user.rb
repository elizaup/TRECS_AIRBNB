class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rentals
  has_many :items, through: :rentals

  validates :first_name, :last_name, :username, :adress, :encrypted_password, :email, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :username, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
end
