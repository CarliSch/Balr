class Club < ApplicationRecord
  has_many :club_requests
  has_many :users, through: :club_requests
  has_many :matches, through: :challenges
  belongs_to :user
  has_many :tournaments, through: :club_tournaments

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
end
