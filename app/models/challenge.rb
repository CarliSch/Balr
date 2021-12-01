class Challenge < ApplicationRecord
  belongs_to :challenged_club, foreign_key: "challenged_club_id", class_name: "Club"
  belongs_to :challenging_club, foreign_key: "challenging_club_id", class_name: "Club"

  has_one :match
end
