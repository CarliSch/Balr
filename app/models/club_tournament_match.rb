class ClubTournamentMatch < ApplicationRecord
  belongs_to :club
  belongs_to :tournament_matches
end
