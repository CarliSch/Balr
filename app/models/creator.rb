class Creator < ApplicationRecord
  belongs_to :user
  has_many :tournaments
  has_many :tournament_requests
  has_many :tournament_requests, through: :tournaments
  has_many :referee_requests
end
