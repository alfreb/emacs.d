# Dot-source this in e.g. .bashrc

# Get updates
echo -e "\n>>> Getting emacs environment updates"
pushd ~/.emacs.d/
git pull origin master
. ./env_vars.sh
popd
