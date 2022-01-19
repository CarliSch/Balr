class ChallengesController < ApplicationController
  before_action :set_challenge

  def accept
    @challenge.update(status: "accepted")

    @challenge.clubs.each_with_index do |club, index|
      team_name = index.zero? ? "A" : "B"
      club.members.each do |member|
        @challenge.match.match_users.create(
          user: member,
          team: team_name
        )
      end
      authorize @challenge
    end

    redirect_to match_path(@challenge.match)
  end

  def decline
    @challenge.update(status: "declined")

    redirect_to club_path(@challenge.challenged_club)
    authorize @challenge
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
