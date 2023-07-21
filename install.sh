#!/bin/sh

readonly packages_path="$HOME/.local/share/BPM/pkgs/"
readonly manpages_path="$HOME/.local/share/BPM/man/"
readonly repos_path="$HOME/.local/share/BPM/repos/"

is_on_path=0

if [ ! "$repos_path" ]; then
  mkdir -p "$repos_path"
fi

if [ ! -d "$packages_path" ]; then
  mkdir -p "$packages_path"
fi

if [ ! -d "$manpages_path" ]; then
  mkdir -p "$manpages_path"
fi

./src/bpm -r ./templates/ -d bpm

which bpm > /dev/null 2>&1 && echo "BPM is on path at $(which bpm)" || echo "BPM is not on path. Check if $HOME/.local/bin/ is on user path"

echo "For manpages to be used make sure $HOME/.local/share/man is on /etc/man.conf"
echo "OR"
echo "run echo $HOME/.local/share/man > /etc/man.conf (as root)"
echo ""
echo "make sure to run makewhatis (with root privilages) after this step"
