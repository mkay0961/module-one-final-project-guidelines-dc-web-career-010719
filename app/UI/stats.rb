def get_stats(id)

  #binding.pry

  url = "http://lookup-service-prod.mlb.com/json/named.sport_hitting_tm.bam?league_list_id='mlb'&game_type='R'&season='2017'&player_id=" + id

  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  hitting = JSON.parse(response.body)

  hinfo = hitting["sport_hitting_tm"]["queryResults"]

  url = "http://lookup-service-prod.mlb.com/json/named.sport_pitching_tm.bam?league_list_id='mlb'&game_type='R'&season='2017'&player_id=" + id

  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  pitching = JSON.parse(response.body)
  pitchinfo = pitching["sport_pitching_tm"]["queryResults"]
#binding.pry
  if pitchinfo.size == 3
    pitchinfo1 = pitchinfo["row"]

    puts "The pitching STATS for #{Player.find_by(playerid: id).full_name}"

    rows = []
    rows << ['ERA', pitchinfo1["era"]]
    rows << ['ER', pitchinfo1["er"]]
    rows << ['W', pitchinfo1["w"]]
    rows << ['SO', pitchinfo1["so"]]
    rows << ['BB', pitchinfo1["bb"]]
    rows << ['HR', pitchinfo1["hr"]]
    rows << ['SV', pitchinfo1["sv"]]
    table = Terminal::Table.new :rows => rows
    puts table
  end
  if hinfo.size == 3
    hingo1 = hinfo["row"]
    puts "The hitting STATS for #{Player.find_by(playerid: id).full_name}"
    rows = []
    rows << ['AVG', 1]
    rows << ['HR', 2]
    rows << ['RBI', 3]
    rows << ['SB', 4]
    rows << ['SO', 5]
    table = Terminal::Table.new :rows => rows
    puts table
  end
  if hinfo.size == 2
    puts "There are no hitting STATS for #{Player.find_by(playerid: id).full_name}"
  end
  if pitchinfo.size == 2
    puts "There are no pitching STATS for #{Player.find_by(playerid: id).full_name
    }"
  end







end
