class TournamentGroup < ApplicationRecord
  belongs_to :tournament


  require "round_robin_tournament"

  clubs = @clubs
  teams = RoundRobinTournament.schedule(clubs)

  # Print for each day, each team
  teams.each_with_index do |day, index|
    day_teams = day.map { |team| "(#{team.first}, #{team.last})" }.join(", ")
    puts "Day #{index + 1}: #{day_teams}"
  end


end
