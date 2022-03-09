class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  has_many :tournament_clubs

  def teams
    Club.find(TournamentGroup.find(self.id).bracket)
  end

  #add a ranking method

#  def ranking
#    ranking = []
#    teams.each do |team|
#      ranking << [team, score(team)]
#    end
#    return ranking.sort_by { |array| -array[1] }
#  end
end
