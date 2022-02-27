class ClubTournamentMatch < ApplicationRecord
  belongs_to :club
  belongs_to :tournament_matches

  def participating
    Club.find(TournamentMatch.find(self.id).versus)
  end
  
end
