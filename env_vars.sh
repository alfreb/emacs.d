# Environment vars 
export INCLUDEOS_SRC=~/IncludeOS
export INCLUDEOS_PREFIX=~/includeos_install
export OS=$INCLUDEOS_SRC/src
export TEST=~/IncludeOS/test
export APP=$(cat ~/.emacs.d/app)
export PATH=$PATH:$INCLUDEOS_PREFIX/bin

clang_versions="6.0 5.1 4.0 3.9 3.8 3.7"

function detect_clang() {
    for ver in $clang_versions
    do
	cc="clang-$ver"
	cxx="clang++-$ver"
	if command -v $cxx &> /dev/null
	then
	    export CC=$cc
	    export CXX=$cxx
	    break
	fi
    done
    echo "Using CC: $CC, CXX: $CXX"
}

detect_clang

# Aliases
alias os="cd $OS"
alias app="cd $APP"
alias setapp=". ~/.emacs.d/setapp.sh"

# -nw is useful when you work in an environment with emacs-GUI (I don't use it)
alias emacs="emacs -nw"

# Most common typo
alias eamcs="emacs"
