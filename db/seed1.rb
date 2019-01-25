require_relative '../config/environment'

Team.destroy_all

class GetTeams

  URL = "http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2018'"
  def get_teams
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_JSON
    return teams = JSON.parse(self.get_teams)
  end


end

puts "Lets create the TEAM database"
teams = GetTeams.new
hash = teams.parse_JSON
hash["team_all_season"]["queryResults"]["row"].each do |team|
  name = team["name_display_full"]
  city = team["city"]
  league = team["league_full"]
  venue = team["venue_name"]
  state = team["state"]
  division = team["division_full"]
  link = team["store_url"]
  phonenumber  = team["phone_number"]
  teamid = team["team_id"]
  print "."
  Team.find_or_create_by(name: name ,city: city, league: league, venue: venue, state: state, division: division, link: link, phonenumber: phonenumber, teamid: teamid)
end
puts "\nAll the teams were created!!!!"
sleep(2)
system "clear"

puts "ENTER 'rake db:seed2'"
