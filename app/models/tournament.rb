class Tournament < ApplicationRecord
  belongs_to :creator
  has_many :tournament_groups
  has_many :tournament_matches
  has_many :tournament_requests
  has_many :clubs, through: :tournament_requests

  after_create :create_tournament_groups

  def teams
    Club.joins(:tournament_requests).where(tournament_requests: { status: "accepted", tournament: self })
  end

  #create "new_team" method that automatically calls Tournament.update! when a new team has joined

  def pending_tournament_request
    Club.joins(:tournament_requests).where(tournament_requests: { status: "pending" })
  end

  # add a tournament_group number so that its possible to itterate through and add 1+ on each number as a new group is being created.
  
  def number_of_groups
    if amount_of_teams <= 8
      number_of_groups = 2
    elsif amount_of_teams >= 12
      number_of_groups = 4
    else
      puts "invalid amount of groups"
    end
  end

  private

  def create_tournament_groups
    number_of_groups.times do
      TournamentGroup.create!(tournament: self)
    end
  end
end
