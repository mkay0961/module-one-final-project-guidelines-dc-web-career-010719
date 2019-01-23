Team.destroy_all
Player.destroy_all
PlayerTeam.destroy_all

blues = Team.find_or_create_by(name:"washington blue" ,city: "washington", league: "NL", venue: "blue stadium", state: "DC", division: "NL East"  link: "1.com" Phonenumber: "70") 
reds = Team.find_or_create_by(name:"DC reds" ,city: "washington DC", league: "NL", venue: "reds stadium",  state: "VA", division: "AL East"  link: "2.com" Phonenumber: "70")
orange = Team.find_or_create_by(name:"DC oranges" ,city: "washington", league: "NL", venue: "orange stadium",  state: "MD", division: "CL West"  link: "3.com" Phonenumber: "70")

alex = Player.find_or_create_by(full_name: "alex smith", position: "pitcher", jersey_number: 3, height: 71, age: 20, bats: "R", twitterid: "@alex", throws: "L", nickname:"Big al")
fred = Player.find_or_create_by(full_name: "fred smith", position: "catcher", jersey_number: 77, height: 75, age: 30, bats: "R", twitterid: "@fred", throws: "L", nickname:"Big f")
sarah = Player.find_or_create_by(full_name: "sarah smith", position: "short stop", jersey_number: 60, height: 70, age: 29, bats: "L", twitterid: "@sara", throws: "L", nickname:"Big s")
matt = Player.find_or_create_by(full_name: "matt matt", position: "pitcher", jersey_number: 69, height: 68, age: 27, bats: "R", twitterid: "@matt", throws: "L", nickname:"Big m")
james = Player.find_or_create_by(full_name: "james kay", position: "outfield", jersey_number: 88, height: 70, age: 20, bats: "L", twitterid: "@james", throws: "R", nickname:"Big j")
sydney = Player.find_or_create_by(full_name: "sydney kay", position: "pitcher", jersey_number: 11, height: 72, age: 21, bats: "R", twitterid: "@syd", throws: "R", nickname:"Big syd")
aaron = Player.find_or_create_by(full_name: "aaron kay", position: "first base", jersey_number: 44, height: 77, age: 22, bats: "R", twitterid: "@aaron", throws: "L", nickname:"Big aa")
matt = Player.find_or_create_by(full_name: "matt kay", position: "pitcher", jersey_number: 33, height: 64, age: 23, bats: "R", twitterid: "@matt", throws: "L", nickname:"Big m2")




join1 = PlayerTeam.find_or_create_by(player: alex, team: blues)
join2 = PlayerTeam.find_or_create_by(player: fred, team: reds)
join3 = PlayerTeam.find_or_create_by(player: sarah, team: blues)
join4 = PlayerTeam.find_or_create_by(player: matt, team: blues)
