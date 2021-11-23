class Club < ApplicationRecord
  has_many :club_requests
  has_many :users, through: :club_requests

  validates :name, presence: true, uniqueness: true
end
