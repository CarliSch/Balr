class User < ApplicationRecord
  POSITIONS = [
    "GK",
    "RB",
    "LB",
    "CB",
    "DM",
    "RM",
    "CM",
    "ST",
    "CAM",
    "LM",
    "CF"
  ]

  FULL_POSITIONS = {
    "GK" => "Goalkeeper",
    "RB" => "Right Full-back",
    "LB" => "Left Full-back",
    "CB" => "Center-back",
    "DM" => "Defensive Midfielder",
    "RM" => "Right Midfielder",
    "CM" => "Center Midfielder",
    "ST" => "Striker",
    "CAM" => "Attacking Midfielder",
    "LM" => "Left Midfielder",
    "CF" => "Center Forward"
  }

  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :match_users
  has_many :matches, through: :match_users
  has_many :club_requests
  has_one :club, through: :club_requests

  validates :first_name, :last_name, :birthday, :city, :position, presence: true
  validates :position, inclusion: { in: POSITIONS }
  has_one_attached :photo

  enumerize :position, in: POSITIONS

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def position_picture
    case position
    when "ST" then "striker.jpg"
    when "GK" then "goalkeeper.jpg"
    when "RB" then "defender_midfield.jpg"
    when "LB" then "defender_midfield.jpg"
    when "CB" then "defender_midfield.jpg"
    when "DM" then "defender_midfield.jpg"
    when "RM" then "defender_midfield.jpg"
    when "CM" then "defender_midfield.jpg"
    when "CF" then "striker.jpg"
    when "LM" then "defender_midfield.jpg"
    else
      "footballpitch.jpg"
    end
  end

  def full_position_name
    FULL_POSITIONS[position]
  end

  def club
    @club ||= Club.joins(:club_requests).find_by(club_requests: { user: self, status: "accepted" })
  end

  def owned_club
    @owned_club ||= Club.find_by(user: self)
  end

  def captain_of_own_club?
    return false unless club

    club.user == self
  end
end
