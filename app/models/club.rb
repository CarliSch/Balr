class Club < ApplicationRecord
  has_many :club_requests
  has_many :users, through: :club_requests
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  has_one_attached :photo

  def members
    User.joins(:club_requests).where(club_requests: { status: "accepted", club: self })
  end

  def challenge_requests
    Challenge.where(challenged_club: self, status: "pending")
  end
end
