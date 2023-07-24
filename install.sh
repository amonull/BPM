#!/bin/sh

readonly packages_path="$HOME/.local/share/BPM/pkgs/"
readonly repos_path="$HOME/.local/share/BPM/repos/"

[ -d "$repos_path" ] || mkdir -p "$repos_path"

[ -d "$packages_path" ] || mkdir -p "$packages_path"

./src/bpm -r "$(dirname "$(realpath "$0")")/templates" -d bpm

if which bpm > /dev/null 2>&1; then
  echo ""
  echo "BPM is on path at $(which bpm)"
else
  echo ""
  echo "BPM is not on path. Check if $HOME/.local/bin/ is on user path"
fi

echo ""
echo ""
echo "For manpages to be used make sure $HOME/.local/share/man is on /etc/man.conf"
echo "OR"
echo "run echo $HOME/.local/share/man > /etc/man.conf (as root)"
echo ""
echo "make sure to run makewhatis (with root privilages) after this step"
