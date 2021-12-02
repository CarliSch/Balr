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
    "GK" => "full post name",
    "RB" => "full post name",
    "LB" => "full post name",
    "CB" => "full post name",
    "DM" => "full post name",
    "RM" => "full post name",
    "CM" => "full post name",
    "ST" => "full post name",
    "CAM" => "full post name",
    "LM" => "full post name",
    "CF" => "full post name",
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
