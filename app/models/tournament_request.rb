class TournamentRequest < ApplicationRecord
  
  belongs_to :club
  belongs_to :tournament
  belongs_to :creator

  validates :status, inclusion: {in: ["pending", "accepted", "declined"]}
  validates :club_id, uniqueness: { scope: :tournament_id }


  scope :pending, -> { where(status: "pending") }
end
