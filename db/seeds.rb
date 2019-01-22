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
james = Player.find_or_create_by(full_name: "james kay", position: "outfield", jersey_number: 88)
sydney = Player.find_or_create_by(full_name: "sydney kay", position: "pitcher", jersey_number: 11)
aaron = Player.find_or_create_by(full_name: "aaron kay", position: "first base", jersey_number: 44)
matt = Player.find_or_create_by(full_name: "matt kay", position: "pitcher", jersey_number: 33)




join1 = PlayerTeam.find_or_create_by(player: alex, team: blues)
join2 = PlayerTeam.find_or_create_by(player: fred, team: reds)
join3 = PlayerTeam.find_or_create_by(player: sarah, team: blues)
join4 = PlayerTeam.find_or_create_by(player: matt, team: blues)
