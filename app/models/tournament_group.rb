class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  has_many :tournament_clubs

  def standings
    @standings = []
    @tournament_clubs ||= TournamentClub.where(tournament_group: self)
    @tournament_clubs.each do |club|
      @standings << club.points
    end
    @standings = @standings.sort
    @standings.reverse
  end
end
