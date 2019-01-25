require_relative '../config/environment'




def message
  system "clear"


  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
_____ _            __  __ _     ____
|_   _| |__   ___  |  \/  | |   | __ )
  | | | '_ \ / _ \ | |\/| | |   |  _ \
  | | | | | |  __/ | |  | | |___| |_) |
  |_| |_| |_|\___| |_|  |_|_____|____/

     _       _        _
  __| | __ _| |_ __ _| |__   __ _ ___  ___
 / _` |/ _` | __/ _` | '_ \ / _` / __|/ _ \
| (_| | (_| | || (_| | |_) | (_| \__ \  __/
 \__,_|\__,_|\__\__,_|_.__/ \__,_|___/\___|



    EOF
  end
  puts box


  # puts <<-'EOF'
  # __          __  _                            _          _   _
  # \ \        / / | |                          | |        | | | |
  #  \ \  /\  / /__| | ___ ___  _ __ ___   ___  | |_ ___   | |_| |__   ___
  #   \ \/  \/ / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \  | __| '_ \ / _ \
  #    \  /\  /  __/ | (_| (_) | | | | | |  __/ | || (_) | | |_| | | |  __/
  #     \/  \/ \___|_|\___\___/|_|_|_| |_|\___|  \__\___/   \__|_| |_|\___|
  #                       |  \/  | |    |  _ \
  #                       | \  / | |    | |_) |
  #                       | |\/| | |    |  _ <
  #                       | |  | | |____| |_) |
  #           _____       |_|  |_|______|____/
  #          |  __ \      | |      | |
  #          | |  | | __ _| |_ __ _| |__   __ _ ___  ___
  #          | |  | |/ _` | __/ _` | '_ \ / _` / __|/ _ \
  #          | |__| | (_| | || (_| | |_) | (_| \__ \  __/
  #          |_____/ \__,_|\__\__,_|_.__/ \__,_|___/\___|
  #
  #
  #
  #
  # EOF
  sleep(1)

  system "clear"



  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                                 _--_     dMb
                                              __(._  )   d0P
                                                <  (D)  .MP
                                              .~ \ /~```M-.
                                            .~    V    Mo_ \
    -------============((((}{)              (   (___. {:)-./
                                            ~._____.(:}
                                             /     .M\
                                            /      "" \
                                            |    /\   |
                                            /   /  \   \
                                            /   /    \   \
                                            \__/      \__/
                                            / /        | |
                                           .^V^.      .^V^.
                                            +-+        +-+
    EOF
  end
  puts box
  # puts <<-'EOF'
  #                                              _--_     dMb
  #                                           __(._  )   d0P
  #                                             <  (D)  .MP
  #                                           .~ \ /~```M-.
  #                                         .~    V    Mo_ \
  # -------============((((}{)              (   (___. {:)-./
  #                                         ~._____.(:}
  #                                          /     .M\
  #                                         /      "" \
  #                                         |    /\   |
  #                                         /   /  \   \
  #                                         /   /    \   \
  #                                         \__/      \__/
  #                                         / /        | |
  #                                        .^V^.      .^V^.
  #                                         +-+        +-+
  # EOF

  sleep(0.2)

  system "clear"



  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                                 _--_     dMb
                                              __(._  )   d0P
                                                <  (D)  .MP
                                              .~ \ /~```M-.
                                            .~    V    Mo_ \
      -------============((((}{)            (   (___. {:)-./
                                            ~._____.(:}
                                             /     .M\
                                            /      "" \
                                            |    /\   |
                                            /   /  \   \
                                            /   /    \   \
                                            \__/      \__/
                                            / /        | |
                                           .^V^.      .^V^.
                                            +-+        +-+
    EOF
  end
  puts box

  # puts <<-'EOF'
  #                                              _--_     dMb
  #                                           __(._  )   d0P
  #                                             <  (D)  .MP
  #                                           .~ \ /~```M-.
  #                                         .~    V    Mo_ \
  #   -------============((((}{)            (   (___. {:)-./
  #                                         ~._____.(:}
  #                                          /     .M\
  #                                         /      "" \
  #                                         |    /\   |
  #                                         /   /  \   \
  #                                         /   /    \   \
  #                                         \__/      \__/
  #                                         / /        | |
  #                                        .^V^.      .^V^.
  #                                         +-+        +-+
  # EOF

  sleep(0.2)

  system "clear"



  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                                 _--_     dMb
                                              __(._  )   d0P
                                                <  (D)  .MP
                                              .~ \ /~```M-.
                                            .~    V    Mo_ \
         -------============((((}{)         (   (___. {:)-./
                                            ~._____.(:}
                                             /     .M\
                                            /      "" \
                                            |    /\   |
                                            /   /  \   \
                                            /   /    \   \
                                            \__/      \__/
                                            / /        | |
                                           .^V^.      .^V^.
                                            +-+        +-+
    EOF
  end
  puts box


  # puts <<-'EOF'
  #                                              _--_     dMb
  #                                           __(._  )   d0P
  #                                             <  (D)  .MP
  #                                           .~ \ /~```M-.
  #                                         .~    V    Mo_ \
  #      -------============((((}{)         (   (___. {:)-./
  #                                         ~._____.(:}
  #                                          /     .M\
  #                                         /      "" \
  #                                         |    /\   |
  #                                         /   /  \   \
  #                                         /   /    \   \
  #                                         \__/      \__/
  #                                         / /        | |
  #                                        .^V^.      .^V^.
  #                                         +-+        +-+
  # EOF
  sleep(0.2)

  system "clear"

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                                 _--_     dMb
                                              __(._  )   d0P
                                                <  (D)  .MP
                                              .~ \ /~```M-.
                                            .~    V    Mo_ \
            -------============((((}{)      (   (___. {:)-./
                                            ~._____.(:}
                                             /     .M\
                                            /      "" \
                                            |    /\   |
                                            /   /  \   \
                                            /   /    \   \
                                            \__/      \__/
                                            / /        | |
                                           .^V^.      .^V^.
                                            +-+        +-+
    EOF
  end
  puts box

  # puts <<-'EOF'
  #                                              _--_     dMb
  #                                           __(._  )   d0P
  #                                             <  (D)  .MP
  #                                           .~ \ /~```M-.
  #                                         .~    V    Mo_ \
  #         -------============((((}{)      (   (___. {:)-./
  #                                         ~._____.(:}
  #                                          /     .M\
  #                                         /      "" \
  #                                         |    /\   |
  #                                         /   /  \   \
  #                                         /   /    \   \
  #                                         \__/      \__/
  #                                         / /        | |
  #                                        .^V^.      .^V^.
  #                                         +-+        +-+
  # EOF







  sleep(0.2)
  system "clear"


  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                        _--_
                                       ( A's)
                                       /___7
                                     .~~\ /~~.
                                   /""_  V    \
                                  om /____/   /
                              .mmmC="_      _/
          -----===(((((}{).MMM ""  |  `"---"
                     ..mMMM""       |        \
                     (  )"          \    /\   |
                                    /   /  \   \
                                  /"   /    \   \
                                  \__/"      \__/
                                 / /        | |
                                .^V^.      .^V^.
                                 +-+        +-+
    EOF
  end
  puts box
  # puts <<-'EOF'
  #                                     _--_
  #                                    ( A's)
  #                                    /___7
  #                                  .~~\ /~~.
  #                                /""_  V    \
  #                               om /____/   /
  #                           .mmmC="_      _/
  #       -----===(((((}{).MMM ""  |  `"---"
  #                  ..mMMM""       |        \
  #                  (  )"          \    /\   |
  #                                 /   /  \   \
  #                               /"   /    \   \
  #                               \__/"      \__/
  #                              / /        | |
  #                             .^V^.      .^V^.
  #                              +-+        +-+
  # EOF








  sleep(0.2)
  system "clear"

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
    <<-'EOF'
                                      dMb
     +  +    +                         MMM         _--_
                    +                   MMM       ( A's)
    +  (}{)                              MMM      /___7
         \\\   +                          "MM   .~~\ /~~.
      +    \\                               MM/""_  V    \
            "\                               om /____/   /
                                             '{:)      _/
                                                `"---" |
                                               |        \
                                               \    /\   |
                                               /   /  \   \
                                             /"   /    \   \
                                             \__/"      \__/
                                             / /        | |
                                            .^V^.      .^V^.
                                             +-+        +-+


    EOF
  end
  puts box

  # puts <<-'EOF'
  #                                   dMb
  #  +  +    +                         MMM         _--_
  #                 +                   MMM       ( A's)
  # +  (}{)                              MMM      /___7
  #      \\\   +                          "MM   .~~\ /~~.
  #   +    \\                               MM/""_  V    \
  #         "\                               om /____/   /
  #                                          '{:)      _/
  #                                             `"---" |
  #                                            |        \
  #                                            \    /\   |
  #                                            /   /  \   \
  #                                          /"   /    \   \
  #                                          \__/"      \__/
  #                                          / /        | |
  #                                         .^V^.      .^V^.
  #                                          +-+        +-+
  #
  #
  # EOF



  puts "\n\n"

  sleep(1)
  puts "\n\n\n\n\n\n\n\n"
  system "clear"
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: TTY::Screen.lines - (TTY::Screen.lines/2),
    align: :center,
    padding: 3
  ) do
     <<-'EOF'
     _    _                       ______           _ _
    | |  | |                     |  ____|         | | |
    | |__| | __ ___   _____      | |__ _   _ _ __ | | |
    |  __  |/ _` \ \ / / _ \     |  __| | | | '_ \| | |
    | |  | | (_| |\ V /  __/     | |  | |_| | | | |_|_|
    |_|  |_|\__,_| \_/ \___|     |_|   \__,_|_| |_(_|_)




    EOF
  end
  puts box
  puts "\n\n"
  sleep(1)

end

system "clear"
puts "Press enter key to begin!"
gets
message
get_menu
