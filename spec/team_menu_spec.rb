require_relative '../config/environment'

describe "TeamMenu" do


  it "return the city, venue and state for the team 'Washington Nationals'" do
    #binding.pry
        expect{get_city_venue_state(Team.find_by(name: "Washington Nationals"))}.to output("The Washington Nationals are from Washington, DC.\nThey play in Nationals Park.\n").to_stdout
  end


  it "return the league for the team 'Washington Nationals'" do
    #binding.pry
        expect{get_league(Team.find_by(name: "Washington Nationals"))}.to output("The Washington Nationals are in the National League.\n").to_stdout
  end

  it "return the division for the team 'Washington Nationals'" do
    #binding.pry
        expect{get_division(Team.find_by(name: "Washington Nationals"))}.to output("The Washington Nationals are in the National League East division.\n").to_stdout
  end

  it "return the phone number for the team 'Washington Nationals'" do
    #binding.pry
        expect{get_phonenumber(Team.find_by(name: "Washington Nationals"))}.to output("The phone number for the Washington Nationals is (202) 349-0400.\n").to_stdout
  end


end
