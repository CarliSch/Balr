class Club < ApplicationRecord
  has_many :club_requests
  has_many :users, through: :club_requests
  has_many :matches, through: :challenges
  belongs_to :user
  has_many :tournament_requests
  has_many :tournaments, through: :tournament_requests
  has_many :tournament_matches, through: :club_tournament_matches

  validates :name, presence: true, uniqueness: true
  has_one_attached :photo

  def members
    User.joins(:club_requests).where(club_requests: { status: "accepted", club: self })
  end

  def challenge_requests
    Challenge.where(challenged_club: self, status: "pending")
  end

  def challenges
    Challenge.distinct.
      where("challenged_club_id = ? OR challenging_club_id = ?", id, id)
  end

  def matches
    Match.where(challenge: challenges.where(status: "accepted"))
  end

  def tournaments
    Tournament.where(tournament_requests: tournament_requests.where(status: "accepted"))
  end

  def tournament
    @tournament ||= Tournament.joins(:tournament_requests).find_by(tournament_requests: { club: self, status: "accepted" })
  end

end
