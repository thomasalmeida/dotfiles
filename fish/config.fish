if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x EDITOR vim

starship init fish | source
set fish_greeting
neofetch

source ~/.asdf/asdf.fish
