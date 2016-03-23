#! /bin/bash

[ -d $INCLUDEOS_SRC/test/$1 ] || { echo "Couldn't find test-directory $1" && exit 1; }

echo "Switching app to $INCLUDEOS_SRC/test/$1/"
pushd ~/.emacs.d
export APP=$1
echo $1 > ./app
git add app
git commit -m "Switching app to ./test/$1"
git push origin master

popd
