class ClubRequest < ApplicationRecord
  belongs_to :user
  belongs_to :club
end
