class ClubTournamentMatch < ApplicationRecord
  belongs_to :tournament_club
  belongs_to :tournament_match
end
