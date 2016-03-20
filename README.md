# Emacs config

Editorconfig has to be installed system-wide before this config will work

`$ sudo apt-get install editorconfig`

then `ln -s ~/.emacs.d/.emacs` should set up this config (possibly remove existing `.emacs`)

## Environment vars, aliases etc. 
I typically work an an "app" (for "appliance") and IncludeOS source at the same time. I'm now using environment variables for those:

```
export src="~/IncludeOS/src"
export app="~/IncldueOS/test/current_test_appliance"
```
will make the custom `make`-comand in work. 

These, and a couple of aliases are now set in [./emacs_env.sh](), which can be dot-sourced into e.g. `.bashrc`