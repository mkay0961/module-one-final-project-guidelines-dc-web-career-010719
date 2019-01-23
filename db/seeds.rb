Team.destroy_all
Player.destroy_all
PlayerTeam.destroy_all

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


class GetPlayers

  URL = ""
  def get_teams
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_JSON
    return teams = JSON.parse(self.get_teams)
  end


end


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
  Team.find_or_create_by(name: name ,city: city, league: league, venue: venue, state: state, division: division, link: link, phonenumber: phonenumber)
end
#binding.pry



# blue = Team.find_or_create_by(name:"washington blue" ,city: "washington", league: "NL", venue: "blue stadium", state: "DC", division: "NL East",  link: "1.com", phonenumber: "70")
# red = Team.find_or_create_by(name:"DC reds" ,city: "washington DC", league: "NL", venue: "reds stadium",  state: "VA", division: "AL East",  link: "2.com", phonenumber: "70")
# orange = Team.find_or_create_by(name:"DC oranges" ,city: "washington", league: "LL", venue: "orange stadium",  state: "MD", division: "CL West",  link: "3.com", phonenumber: "70")
# yellow = Team.find_or_create_by(name:"yellows " ,city: "arlington", league: "KL", venue: "yellow stadium", state: "VA", division: "NL East",  link: "4.com", phonenumber: "70")
# white = Team.find_or_create_by(name:"LM white" ,city: "lemania", league: "AL", venue: "white stadium",  state: "VA", division: "CL East",  link: "6.com", phonenumber: "70")
# green = Team.find_or_create_by(name:"MD greens" ,city: "potomac", league: "BL", venue: "green stadium",  state: "MD", division: "CL West",  link: "5.com", phonenumber: "70")





# alex = Player.find_or_create_by(full_name: "alex smith", position: "pitcher", jersey_number: 3, height: 71, age: 20, bats: "R", twitterid: "@alex", throws: "L", nickname:"Big al")
# fred = Player.find_or_create_by(full_name: "fred smith", position: "catcher", jersey_number: 77, height: 75, age: 30, bats: "R", twitterid: "@fred", throws: "L", nickname:"Big f")
# sarah = Player.find_or_create_by(full_name: "sarah smith", position: "short stop", jersey_number: 60, height: 70, age: 29, bats: "L", twitterid: "@sara", throws: "L", nickname:"Big s")
# matt = Player.find_or_create_by(full_name: "matt matt", position: "pitcher", jersey_number: 69, height: 68, age: 27, bats: "R", twitterid: "@matt", throws: "L", nickname:"Big m")
# james = Player.find_or_create_by(full_name: "james kay", position: "outfield", jersey_number: 88, height: 70, age: 20, bats: "L", twitterid: "@james", throws: "R", nickname:"Big j")
# sydney = Player.find_or_create_by(full_name: "sydney kay", position: "pitcher", jersey_number: 11, height: 72, age: 21, bats: "R", twitterid: "@syd", throws: "R", nickname:"Big syd")
# aaron = Player.find_or_create_by(full_name: "aaron kay", position: "first base", jersey_number: 44, height: 77, age: 22, bats: "R", twitterid: "@aaron", throws: "L", nickname:"Big aa")
# matt2 = Player.find_or_create_by(full_name: "matt kay", position: "pitcher", jersey_number: 33, height: 64, age: 23, bats: "R", twitterid: "@matt", throws: "L", nickname:"Big m2")
#
#
#
#
# join1 = PlayerTeam.find_or_create_by(player: alex, team: blue)
# join2 = PlayerTeam.find_or_create_by(player: fred, team: red)
# join3 = PlayerTeam.find_or_create_by(player: sarah, team: blue)
# join4 = PlayerTeam.find_or_create_by(player: matt, team: yellow)
# join5 = PlayerTeam.find_or_create_by(player: james, team: white)
# join6 = PlayerTeam.find_or_create_by(player: sydney, team: red)
# join7 = PlayerTeam.find_or_create_by(player: aaron, team: green)
# join8 = PlayerTeam.find_or_create_by(player: matt2, team: blue)
# join9 = PlayerTeam.find_or_create_by(player: alex, team: green)
