class ClubRequest < ApplicationRecord
  belongs_to :user
  belongs_to :club
  validates :status, inclusion: {in: ["pending", "accepted", "declined"]}

  validates :user_id, uniqueness: { scope: :club_id }

  scope :pending, -> { where(status: "pending") }
end
