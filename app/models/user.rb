class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :match_users
  has_many :matches, through: :match_users
  has_many :matches
  has_one :club

  validates :first_name, :last_name, :birthday, :city, :position, presence: true
  has_one_attached :photo

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end
