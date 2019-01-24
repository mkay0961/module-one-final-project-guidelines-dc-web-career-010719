CLI MLB Database Navigator

Written by Matthew Kay and James Clement
2019

This program is provides a Command Line Interface which allows the user to access information about players and teams which were a part of the 2018 Season of Major League Baseball.

All data used is courtesy of https://appac.github.io/mlb-data-api-docs/

To use this database on your computer, download the program from github.
In your terminal, run 'rake db:seed' to seed your local database from the API.

To run rspec tests, enter rspec in terminal.

To start the program, run in terminal: 'ruby bin/run.rb'

Users are first prompted to choose between searching for a player or team.

To find information about a specific team, users can select from a list of all 30 teams, or navigate to the teams of a specific player.

To find information about a specific player, a user can search by name from a list of all players, or choose a player from a team's roster.

To restart the program, users can enter "restart".

When finished with the database, users can enter "exit".

Thank you for using our CLI MLB Database Navigator!
