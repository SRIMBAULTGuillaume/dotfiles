export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.script
PATH=$PATH:/var/lib/snapd/snap/bin

#Clean the path by removing the double elements
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}            # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;               # already there
      *) PATH=$PATH:$x;;         # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  export PATH=${PATH#:}
  unset old_PATH x
fi
