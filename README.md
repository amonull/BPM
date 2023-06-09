# BPM
so far this program is incomplete however any imporvments or suggestions is more than welcom.

# Major/Breaking Version 0.1_alpha Changes
Sqlite added as dependecy, BPM no longer looks for packages in `$HOME/.local/BPM/repo-list/` but instead reads it from `$HOME/.local/share/BPM/main-repo.db`.

The sqlite db holds all needed information about a package.

The information is:
- name of package
- built exe files name
- (optional i.e. only on non binaries) build instructions
- (optional) update instructions
- paths to uninstall (to remove manpages, libs, everything created by that package)
- version of package
- dependecies (both as BPM installable and pure name filed names -> BPM_dep, host_dep) a package can choose to populate both and with the use of flag `-b|--use-bpm-deps` instead of printing out needed dependecies, the dependecies in BPM_dep can be installed using BPM instead (Note: BPM will not have all deps by default so any dep found in host_dep but not in BPM_dep will still be printed first before installing anything so that the user has everything needed to install/build/use the said package)
- licence for package

Structure of db:
- table named -> pkgs
    - holds name of package, version of package, licence
- table named -> deps
    - holds BPM_dep (dependecies that can be built with bpm) host_dep (dependecies that needs to be installed by the user using their package manager)
- table named -> instructions
    - hold build, update instructions for a package, uninstall paths

# TODO:
- add functions to update packages and sync repos (temporarily done (untested) needs improvments)
- improve function to remove pakcages
- add correct licences to packages
- correctly download the nececery licences on to specified dirs (most likely $HOME/.local/BPM/licences/\<pkg\>/\<licecence\>

# Dependecies:
- grep
- which
- posix shell
- curl
- wget
- git
- find

# required paths
for this program to work paths ```$HOME/.local/BPM/pkgs/ && $HOME/.local/BPM/repo-list/{official-repo,user-repo}``` must be created and to run packages downloaded ```$HOME/.local/BPM/pkgs/``` must be on path.

# install template
to install a program create ```<name>.<download_method>.sh``` file in ```$HOME/.local/BPM/repo-list/{official-repo,user-repo}``` inside the file some variables 

MUST be set:
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

Since i only use xbps package manager for my system the check_dependecy function may not work for other package managers as i found information about them only by google and they haven't been tested
