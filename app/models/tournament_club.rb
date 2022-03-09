class TournamentClub < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :tournament_knockout
  belongs_to :club
  has_many :club_tournament_matches
end
