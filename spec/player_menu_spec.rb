require_relative '../config/environment'

describe "PlayerMenu" do

      it "return the twitter id for the player 'alec asher'" do
            expect{get_twitter(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher is on twitter at  @TheBigCat28.\n").to_stdout
      end
      it "return the nickname for the player 'alec asher'" do
            expect{get_nickname(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher also goes by The Big Cat.\n").to_stdout
      end
      it "return the throws for the player 'alec asher'" do
            expect{get_throws(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher throws R.\n").to_stdout
      end
      it "return the bats for the player 'alec asher'" do
            expect{get_bats(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher bats R.\n").to_stdout
      end
      it "return the age for the player 'alec asher'" do
            expect{get_age(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher was 27.\n").to_stdout
      end
      it "return the height for the player 'alec asher'" do
            expect{get_height(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher is 76 inches tall.\n").to_stdout
      end
      it "return the jersey number for the player 'alec asher'" do
            expect{get_jersey_num(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher wore the number 49.\n").to_stdout
      end
      it "return the position for the player 'alec asher'" do
            expect{get_position(Player.find_by(full_name:"Alec Asher"))}.to output("Alec Asher primarily played P.\n").to_stdout
      end

end
