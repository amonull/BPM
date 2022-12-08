# THIS IS AN EXAMPLE INSTALLATION FILE TO SHOW THE BASICS

USER_WIDE_INSTALLATION=false

# VOID
DEPENDENCIES_XBPS="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_XBPS="fzf"

# DEBIAN
DEPENDENCIES_DPKG="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_DPKG="fzf"

# ARCH
DEPENDENCIES_PACMAN="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_PACMAN="fzf"

# FEDORA
DEPENDENCIES_RPM="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_RPM="fzf"

# SUSE
DEPENDENCIES_ZYPPER="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_ZYPPER="fzf"

# GENTOO
DEPENDENCIES_PORTAGE="grep sed awk curl openssl mpv axel ffmpeg"
OPTIONAL_DEPENDENCIES_PORTAGE="fzf"

DOWNLOAD_METHOD="git clone"

URL="https://github.com/pystardust/ani-cli.git"

install_cmd () {
    mv /tmp/BPM.*/ani-cli $HOME/.local/BPM/pkgs/
}

remove_cmd () {
    rm -f $HOME/.local/BPM/pkgs/ani-cli
}
