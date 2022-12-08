# THIS IS AN EXAMPLE INSTALLATION FILE TO SHOW THE BASICS

USER_WIDE_INSTALLATION=false

# dependencies will target certain package managers make sure to include dependencies for your package manager
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

# download method must have either "git clone", "curl", or "wget" to start with and can have more options defined inside later
# ie: 
# DOWNLOAD_METHOD="git clone --quite" == valid 
# DOWNLOAD_METHOD="--quite git clone" == invalid (invalid for both BPM and git)
DOWNLOAD_METHOD="git clone"

URL="https://github.com/pystardust/ani-cli.git"

# if function is not begin used add:
# echo "TODO:"; exit 1
install_cmd () {
    mv /tmp/BPM.*/ani-cli $HOME/.local/BPM/pkgs/
}

# if function is not begin used add:
# echo "TODO:"; exit 1
remove_cmd () {
    rm -f $HOME/.local/BPM/pkgs/ani-cli
}
