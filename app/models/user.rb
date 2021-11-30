class User < ApplicationRecord
  POSITIONS = [
    "Goalkeeper",
    "Right Full-back",
    "Left Full-back",
    "Center-back",
    "Sweeper",
    "Defensive Midfielder",
    "Right Midfielder",
    "Center Midfielder",
    "Striker",
    "Attacking Midfielder",
    "Left Midfielder"

  ]

  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :match_users
  has_many :matches, through: :match_users
  has_many :matches
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
    when "Striker" then "goalkeeper.jpg"
    when "Goalkeeper" then "goalkeeper.jpg"
    when "Right Full-back" then "striker.jpg"
    when "Left Full-back" then "defender_midfield.jpg"
    when "Center-back" then "defender_midfield.jpg"
    when "Sweeper" then "defender_midfield.jpg"
    when "Defensive Midfielder" then "defender_midfield.jpg"
    when "Right Midfielder" then "defender_midfield.jpg"
    when "Center Midfielder" then "defender_midfield.jpg"
    when "Center Forward" then "defender_midfield.jpg"
    when "Left Midfielder" then "defender_midfield.jpg"
    else
      "footballpitch.jpg"
    end
  end

  def club
    Club.joins(:club_requests).find_by(club_requests: { user: self, status: "accepted" })
  end
end
