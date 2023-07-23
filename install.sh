#!/bin/sh

readonly packages_path="$HOME/.local/share/BPM/pkgs/"
readonly repos_path="$HOME/.local/share/BPM/repos/"

if [ ! -d "$repos_path" ]; then
  mkdir -p "$repos_path"
fi

if [ ! -d "$packages_path" ]; then
  mkdir -p "$packages_path"
fi

./src/bpm -r "$(dirname "$(realpath "$0")")/templates" -d bpm

which bpm > /dev/null 2>&1 && echo "BPM is on path at $(which bpm)" || echo "BPM is not on path. Check if $HOME/.local/bin/ is on user path"

echo "For manpages to be used make sure $HOME/.local/share/man is on /etc/man.conf"
echo "OR"
echo "run echo $HOME/.local/share/man > /etc/man.conf (as root)"
echo ""
echo "make sure to run makewhatis (with root privilages) after this step"
