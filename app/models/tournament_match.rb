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

end
