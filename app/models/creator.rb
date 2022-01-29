class Creator < ApplicationRecord
  belongs_to :user
  has_many :tournaments
  has_many :referee_requests
end
