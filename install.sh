#!/bin/sh

init_bpm_paths () {
  if [ "$system" = 1 ]; then
    packages_path="/usr/local/share/BPM/"
    repos_path="/usr/local/share/BPM/"

    manpages_path="/usr/share/man/"
    bash_comp_path="/usr/share/bash-completion/"
    fish_comp_path="/usr/share/fish/completions/"
    zsh_comp_path="/usr/share/zsh/vendor-completions"
    desktop_path="/usr/share/applications/"
    symlink_bin_path="/usr/local/bin/"
  else
    packages_path="$HOME/.local/share/BPM/pkgs/"
    repos_path="$HOME/.local/share/BPM/repos/"

    manpages_path="$HOME/.local/share/man/"
    bash_comp_path="$HOME/.local/share/bash-completion/completions/"
    fish_comp_path="$HOME/.local/share/fish/generated_completions/"
    zsh_comp_path="$HOME/.local/share/zsh/vendor-completions/"
    desktop_path="$HOME/.local/share/applications/"
    symlink_bin_path="$HOME/.local/bin/"
  fi

  [ -d "$packages_path" ] || mkdir -p "$packages_path"
  [ -d "$repos_path" ] || mkdir -p "$repos_path"

  [ -d "$manpages_path" ] || mkdir -p "$manpages_path"
  [ -d "$bash_comp_path" ] || mkdir -p "$bash_comp_path"
  [ -d "$fish_comp_path" ] || mkdir -p "$fish_comp_path"
  [ -d "$zsh_comp_path" ] || mkdir -p "$zsh_comp_path" # do not know the path for this so kept empty
  [ -d "$desktop_path" ] || mkdir -p "$desktop_path"
  [ -d "$symlink_bin_path" ] || mkdir -p "$symlink_bin_path"
}

printf "user (bpm) or system (bpm-allow-root) wide installation [U/s]: "
read -r response
case "$response" in
  [sS])
    system=1
    init_bpm_paths
    ./src/bpm -R "$(dirname "$(realpath "$0")")/templates" -d bpm-allow-root
    ;;
  *)
    system=0
    init_bpm_paths
    ./src/bpm -R "$(dirname "$(realpath "$0")")/templates" -d bpm
    ;;
esac

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
echo "OR run"
echo "echo $HOME/.local/share/man >> /etc/man.conf (as root)"
echo ""
echo "make sure to run makewhatis (with root privilages) after this step"
