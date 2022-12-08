# BPM
so far this program is incomplete however any imporvments or suggestions is more than welcom.

# TODO:
- add functions to update packages and sync repos (temporarily done (untested) needs improvments)
- improve function to remove pakcages
- create a proper start point
- add flags to use all functionalities
- create different repo to hold package files for $HOME/.local/BPM/repo-list/official-repo/

# Dependecies:
- grep
- which
- bash/dash
- curl
- wget
- git
- find

# required paths
for this program to work paths ```$HOME/.local/BPM/pkgs/ && $HOME/.local/BPM/repo-list/{official-repo,user-repo}``` must be created and to run packages downloaded ```$HOME/.local/BPM/pkgs/``` must be on path.

# install template
to install a program create ```<name>.<download_method>.sh``` file in ```$HOME/.local/BPM/repo-list/{official-repo,user-repo}``` inside the file some variables 

MUST be set:
- USER_WIDE_INSTALLATION= ```true``` or ```false```
- DOWNLOAD_METHOD= ```"git clone"```, ```"wget"```, ```"curl"``` var must start with those strings and can have more options defined
- URL= url to download file

optional vars:
- DEPENDENCIES_XBPS=
- OPTIONAL_DEPENDENCIES_XBPS=

- DEPENDENCIES_DPKG=
- OPTIONAL_DEPENDENCIES_DPKG

- DEPENDENCIES_PACMAN=
- OPTIONAL_DEPENDENCIES_PACMAN=

- DEPENDENCIES_RPM=
- OPTIONAL_DEPENDENCIES_RPM=

- DEPENDENCIES_ZYPPER=
- OPTIONAL_DEPENDENCIES_ZYPPER=

- DEPENDENCIES_PORTAGE=
- OPTIONAL_DEPENDENCIES_PORTAGE=

above vars must be set to string and be seperated with spaces (eg: DEPENDENCIES_XBPS="grep which dash curl wget git find")

an example template for ani-cli can be found that uses those vars

Must have functions:
```install_cmd(){}``` and ```remove_cmd(){}``` must be defined which is just a sh function that is executed to install that file.

# IMPORTANT:
the ```USER_WIDE_INSTALLATION``` is used to tell the user installing the package that the file will not be downloaded to ```$HOME/.local/BPM/pkgs/``` but instead it will be a system wide install


Since i only use xbps package manager for my system the check_dependecy function may not work for other package managers as i found information about them only by google and they haven't been tested
