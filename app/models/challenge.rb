class Challenge < ApplicationRecord
  belongs_to :challenged_club, foreign_key: "challenged_club_id", class_name: "Club"
end
