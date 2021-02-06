test $TERM != "screen-256color"; and exec tmux
alias g="cd ~/Documents/repos/igraph"
alias u="cd ~/Documents/repos/igraph/tests/unit"
alias b="cd ~/Documents/repos/igraph/build"
alias s="cd ~/Documents/repos/igraph/src"
alias fsc=". ~/.config/fish/config.fish"
alias fcc="cat ~/.config/fish/config.fish"

function gb
    b
    and cmake ..
    and LD_PRELOAD= cmake --build . --target check
end
