class Match < ApplicationRecord
  has_many :match_users
  has_many :users, through: :match_users

  validates :location, :start_at, presence: true
end
