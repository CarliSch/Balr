class MatchesController < ApplicationController

  def index
    @matches = Match.upcoming.order(:start_at)
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
  end

end
