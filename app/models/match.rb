class Match < ApplicationRecord
  has_many :match_users
  has_many :users, through: :match_users

  validates :location, :start_at, presence: true
  attribute :max_players, default: 22

  scope :upcoming, -> { where("matches.start_at > ?", Time.current) }

  def spots_left
    max_players - match_users.count
  end

  def team_a_players
    @team_a_players ||= team_players("A")
  end

  def team_b_players
    @team_b_players ||= team_players("B")
  end

  private

  def team_players(team)
    @match_users_with_users ||= match_users.includes(:user)
    players = @match_users_with_users.filter_map do |match_user|
      match_user.user if match_user.team == team
    end
    players.fill(nil, (players.size)...(max_players / 2))
  end
end
