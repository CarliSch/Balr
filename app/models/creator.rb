class Creator < ApplicationRecord
  belongs_to :user
  has_many :tournaments
end
