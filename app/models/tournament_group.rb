class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  after_create :create_tournament_matches

  def teams
    Club.find(TournamentGroup.find(self.id).bracket)
  end

  def matches
    if teams.size == 4
      6.times.map {2.times.map { TournamentGroup.find(self.id).bracket.sample }}
    end
  end

  def create_tournament_matches
    if teams.size == 4
      matches.each do |match|
        TournamentMatch.create!(tournament_group: self, versus: match)
      end
    end
  end
end
