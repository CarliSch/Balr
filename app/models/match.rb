class Match < ApplicationRecord
  has_many :match_users
  has_many :users, through: :match_users

  validates :location, :start_at, presence: true

  def spots_left
    max_spots - match_users.count
  end

  def max_spots
    22
  end
end
