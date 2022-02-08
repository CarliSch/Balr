class Tournament < ApplicationRecord
  belongs_to :creator
  has_many :tournament_groups
  has_many :tournament_matches
  has_many :tournament_requests
  has_many :clubs, through: :tournament_requests


  def teams
    Club.joins(:tournament_requests).where(tournament_requests: { status: "accepted", tournament: self })
  end

  def pending_tournament_request
    Club.joins(:tournament_requests).where(tournament_requests: { status: "pending" })
  end

end
