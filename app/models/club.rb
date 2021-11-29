class Club < ApplicationRecord
  has_many :club_requests
  has_many :users, through: :club_requests
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
