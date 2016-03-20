# Emacs config

Editorconfig has to be installed system-wide before this config will work
`sudo apt-get install editorconfig`

then `ln -s ~/.emacs.d/.emacs` should set up this config (possibly remote existing `.emacs`)

## Environment vars
I typically work an an "app" (for "appliance") and IncludeOS source at the same time. I'm now using environment variables for those:
`export src="~/IncludeOS/src"
`export app="~/IncldueOS/test/xyz"