# BPM
so far this program is incomplete however any imporvments or suggestions is more than welcom.

# Changelog

> Changes in how bpm works

There no longer is any need for sqlite or any other extra tools.

Packages are now installed onto the packages path (default `$HOME/.local/share/BPM/pkgs/`) but can be changed using the -p flag.

Everything specified inside the template (located in `$HOME/.local/share/BPM/templates/` but can be changed using -r flag) is now installed onto the packages path and everything gets symbolically linked into the correct location.

Every file that has been symbolically linked outside the packages path gets appeneded onto a file called \<pkgname\>_info_file and during uninstallation that file is followed to unlink everything and then to remove that packages path directory completly to remove everything

> Important information

This project is still ***NOT COMPLETE*** so some major functionality is still missing but is planned to be added.

Since this project is still not complete the template style and the template for bpm is also still incomplete but is planned to be added soon, after the template for bpm is complete installing bpm using the [install.sh file](https://github.com/amonull/BPM/blob/main/install.sh) should be possible making installation extremely easy and giving tips on what to do to get everything started. After the bpm template is added this README file will also be fixed removing old and useless information.

This project has seen a lot of changes since i have started it however this version of it will most likely be the last re-write of this since it has finally started to take direction in the place that i want it to go to. There will still most likely be major and breaking changes in the future but not a complete re-write and templates should also not see much changes in how they are created from here on out.

# Dependecies:
- posix shell (like dash or bash)
- grep
- awk
- which
- find
- curl
- git
- install

# Ignore Tags Below
Tags below are useless now due to the new changes added, especially information about making templates. Information on how to make your own templates will soon be added.

# Installation
Version with sqlite
```
git clone https://github.com/amonull/BPM.git

./BPM/src/bpm --template-path ./BPM/repo/Templates/BPM
```

Version without sqlite
```
git clone https://github.com/amonull/BPM.git

./BPM/src/bpm --template-path ./BPM/repo/Templates/BPM-no-sqlite
```


After install add `$HOME/.local/share/BPM/pkgs/` to user path and add `$HOME/.local/share/man/` to manpath in `/etc/man.conf`

> todo below (not yet implemented)

main-repo.db already has installation and updating instructions inside it so `bpm` can update itself, to update `bpm` run `bpm --self-update`.

It updates itself by using git pull

# TODO:
- add functions to update packages and sync repos (temporarily done (untested) needs improvments)
- improve function to remove pakcages
- add correct licences to packages
- correctly download the nececery licences on to specified dirs (most likely $HOME/.local/BPM/licences/\<pkg\>/\<licecence\>

# IMPORTANT -> ALL INFO BELOW IS OUTDATED AND NEEDS TO BE UPDATED

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
