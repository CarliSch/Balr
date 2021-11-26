class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @matches = Match.upcoming.order(:start_at)
    @next_match = @matches.first
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
    @user_next_matches = current_user.matches.upcoming.order(:start_at).limit(3) if user_signed_in?
  end
end
