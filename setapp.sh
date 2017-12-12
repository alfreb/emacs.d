#! /bin/bash

if [ "$#" -lt 1 ] 
then
    echo "Fetching app from disk"
    export APP=`cat ~/.emacs.d/app`
else
    [ -d $1 ] || { echo "Couldn't find test-directory $1" && return 1; }
    echo "Switching app to $INCLUDEOS_SRC/test/$1/"
    pushd ~/.emacs.d
    export APP=$1
    echo $1 > ./app
    popd
fi

echo "App is now $APP"
alias app="cd $APP"


