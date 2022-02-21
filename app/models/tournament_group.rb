class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  after_create :create_tournament_matches, if: :full?

  def teams
    Club.where(TournamentGroup.find(self.id).bracket)
  end

  def full?
    teams.size == 4
  end

  def matches
    6.times.map {2.times.map { TournamentGroup.find(self.id).bracket.sample }}
  end

  def create_tournament_matches
    matches.each do |match|
      TournamentMatch.create!(tournament_group: self, versus: match)
    end
  end
end
