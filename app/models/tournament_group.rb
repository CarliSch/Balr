class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches

  def teams
    Club.find(TournamentGroup.find(self.id).bracket)
  end

#  def ranking
#    ranking = []
#    teams.each do |team|
#      ranking << [team, score(team)]
#    end
#    return ranking.sort_by { |array| -array[1] }
#  end
end
