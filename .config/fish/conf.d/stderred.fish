set -x LD_PRELOAD "/home/daniel/Documents/repos/stderred/build/libstderred.so"
set red (tput setaf 1)
set bold (tput bold)
set -x STDERRED_ESC_CODE (echo -e "$bold$red")
