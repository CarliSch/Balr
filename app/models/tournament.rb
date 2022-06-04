class Tournament < ApplicationRecord
  belongs_to :creator
  has_many :tournament_groups
  has_many :tournament_knockouts
  has_many :tournament_matches
  has_many :tournament_requests
  has_many :clubs, through: :tournament_requests

  validates :start_at, :name, :description, :rules, :age_group, :skill_level, :amount_of_teams, presence: true

  after_create :create_tournament_groups

  def teams
    Club.joins(:tournament_requests).where(tournament_requests: { status: "accepted", tournament: self })
  end

  def pending_tournament_request
    Club.joins(:tournament_requests).where(tournament_requests: { status: "pending" })
  end


  def number_of_groups
    number_of_groups = amount_of_teams / 4
  end

  private

  def create_tournament_groups
    number_of_groups.times do
      TournamentGroup.create!(tournament: self)
    end
  end
end
