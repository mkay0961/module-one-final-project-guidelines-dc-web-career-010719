Team.destroy_all
Player.destroy_all
PlayerTeam.destroy_all

blues = Team.find_or_create_by(name:"washington blue" ,city: "washington", league: "NL", venue: "blue stadium" )
reds = Team.find_or_create_by(name:"DC reds" ,city: "washington DC", league: "NL", venue: "reds stadium" )
orange = Team.find_or_create_by(name:"DC oranges" ,city: "washington", league: "NL", venue: "orange stadium" )

alex = Player.find_or_create_by(full_name: "alex smith", position: "pitcher", jersey_number: 3)
fred = Player.find_or_create_by(full_name: "fred smith", position: "catcher", jersey_number: 77)
sarah = Player.find_or_create_by(full_name: "sarah smith", position: "short stop", jersey_number: 60)
matt = Player.find_or_create_by(full_name: "matt matt", position: "pitcher", jersey_number: 69)

join1 = PlayerTeam.find_or_create_by(player: alex, team: blues)
join2 = PlayerTeam.find_or_create_by(player: fred, team: reds)
join3 = PlayerTeam.find_or_create_by(player: sarah, team: blues)
join4 = PlayerTeam.find_or_create_by(player: matt, team: blues)
