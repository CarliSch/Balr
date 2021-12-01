class MatchUser < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :team, inclusion: { in: ["A", "B"] }
  validates :user_id, uniqueness: { scope: :match_id }
end
