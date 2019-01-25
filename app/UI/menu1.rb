def get_menu
  system "clear"
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "This app allows you to search for information about players and their \nteams during the 2018 Season of Major League Baseball!"
  end
  puts box

  prompt = TTY::Prompt.new
  input = prompt.select("What would you like to know more about?") do |menu|
    menu.choice "Team", 1
    menu.choice "Player", 2
    menu.choice "Exit", 3
  end

  case input
  when 1
    sleep(0.5)
    system "clear"
    team_menu
  when 2
    sleep(0.5)
    system "clear"
    player_menu
  when 3
    system "clear"
    exit_program
  end
end


def exit_program
  system "clear"
  pastel = Pastel.new
  font = TTY::Font.new(:starwars)
  # puts pastel.decorate(font.write("GOODBYE!!!"), :black, :on_white, :bold)
  # puts pastel.decorate("\nThank you for using the MLB Database!".center(86), :black, :on_white, :bold)

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
    _____  ____   ____  _____  ______     ________ _ _
 / ____|/ __ \ / __ \|  __ \|  _ \ \   / /  ____| | |
| |  __| |  | | |  | | |  | | |_) \ \_/ /| |__  | | |
| | |_ | |  | | |  | | |  | |  _ < \   / |  __| | | |
| |__| | |__| | |__| | |__| | |_) | | |  | |____|_|_|
 \_____|\____/ \____/|_____/|____/  |_|  |______(_|_)

   EOF
  end
  puts box
  sleep(1)
end
