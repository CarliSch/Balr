class TournamentClub < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :tournament_knockout, optional: true
  belongs_to :club
  has_many :club_tournament_matches
end
