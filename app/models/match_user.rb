class MatchUser < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :club, optional: true

  validates :team, inclusion: {in: ["A", "B"]}
end
