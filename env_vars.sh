# Environment vars 
export INCLUDEOS_SRC=~/IncludeOS
export INCLUDEOS_HOME=~/IncludeOS_install
export OS=$INCLUDEOS_SRC/src
export TEST=~/IncludeOS/test
export APP=$TEST/$(cat app)

# Aliases
alias os="cd $OS"
alias app="cd $APP"
alias setapp=". ~/.emacs.d/setapp.sh"

# -nw is useful when you work in an environment with emacs-GUI (I don't use it)
alias emacs="emacs -nw"

# Most common typo
alias eamcs="emacs"
