#! /bin/bash

if [ "$#" -lt 1 ] 
then
    echo "Fetching app from disk"
    export APP=$TEST/`cat ~/.emacs.d/app`
else
    [ -d $INCLUDEOS_SRC/test/$1 ] || { echo "Couldn't find test-directory $1" && return 1; }
    echo "Switching app to $INCLUDEOS_SRC/test/$1/"
    pushd ~/.emacs.d
    export APP=$TEST/$1
    echo $1 > ./app
    git add ./app
    git commit -m "Switching app to ./test/$1"
    git push origin master    
    popd
fi

echo "App is now $APP"
alias app="cd $APP"


