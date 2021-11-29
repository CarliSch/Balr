class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :match_users
  has_many :matches, through: :match_users
  has_many :matches

  validates :first_name, :last_name, :birthday, :city, :position, presence: true
  has_one_attached :photo
end
