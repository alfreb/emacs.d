#! /bin/bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

export_app () {
    export APP=`cat ~/.emacs.d/app`    
}

set_app () {
    pushd $1
    export APP=$(pwd)	
    popd
    echo "Switching app to $APP"
    pushd ~/.emacs.d
    echo $APP > ./app
    popd    
}

goto_app () {
    export_app
    echo "Moving to $APP"    
    cd $APP
}

if [ "$#" -lt 1 ] 
then
    export_app
else
    [ -d $1 ] || { echo "Couldn't find test-directory $1" && return 1; }
    goto_app $1
fi

echo "App is now $APP"
alias app="goto_app"


