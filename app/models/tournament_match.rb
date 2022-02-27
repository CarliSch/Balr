class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  has_many :clubs, through: :tournament_groups

  def teams
    Club.find(TournamentMatch.find(self.id).versus)
  end

  def team_1
    teams[0]
  end

  def team_2
    teams[1]
  end

  #add score to team1 and team2, the score will be set to 0 on default and will be changed in the controller through calling update

end
