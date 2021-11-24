class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @matches = Match.upcoming
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
  end
end
