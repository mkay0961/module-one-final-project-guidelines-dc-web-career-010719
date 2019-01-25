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
  case hinfo.size
  when 3
    hingo1 = hinfo["row"]
    puts "\nThe hitting STATS for #{Player.find_by(playerid: id).full_name}"
    table = Terminal::Table.new do |rows|
      rows << ['AVG', hingo1["avg"]]
      rows << :separator
      rows << ['HR', hingo1["hr"]]
      rows << :separator
      rows << ['RBI', hingo1["rbi"]]
      rows << :separator
      rows << ['SB', hingo1["sb"]]
      rows << :separator
      rows << ['SO', hingo1["so"]]
    end
    puts table
  when 2
    puts "\nThere are no hitting STATS for #{Player.find_by(playerid: id).full_name}"
  end



  case pitchinfo.size
  when 3
    pitchinfo1 = pitchinfo["row"]

    puts "\nThe pitching STATS for #{Player.find_by(playerid: id).full_name}"
    table = Terminal::Table.new do |rows|
      rows << ['ERA', pitchinfo1["era"]]
      rows << :separator
      rows << ['ER', pitchinfo1["er"]]
      rows << :separator
      rows << ['W', pitchinfo1["w"]]
      rows << :separator
      rows << ['SO', pitchinfo1["so"]]
      rows << :separator
      rows << ['BB', pitchinfo1["bb"]]
      rows << :separator
      rows << ['HR', pitchinfo1["hr"]]
      rows << :separator
      rows << ['SV', pitchinfo1["sv"]]
    end
    puts table
  when 2
    puts "\nThere are no pitching STATS for #{Player.find_by(playerid: id).full_name
    }"
  end




  prompt = TTY::Prompt.new
  input = prompt.select("\nWhat do you want to do?", per_page: 3) do |menu|
    menu.choice "1." + " GO BACK".red , 1
    menu.choice "2. Find a new" + " player".red , 2
    menu.choice "3." + " Restart ".red + "program", 3
    menu.choice "4." + " Exit ".red + "the program", 4
  end

  case input
  when 1
    system "clear"
    player_info_menu(Player.find_by(playerid: id))
  when 2
    system "clear"
    player_menu
  when 3
    system "clear"
    get_menu
  when 4
    system "clear"
    exit_program
  end









end
