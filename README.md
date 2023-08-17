# BPM

BPM used to stand for basic package manager but no longer stands for that as BPM is not a package manager, it is instead a program that is designed to automate and centralize packages that are built from source.

This program was built for users that use package managers that do not have all the packages that they want they also do not want to go through the hassle of learning other package managers that either offer far more than just simple package mangment but also have little quirks and features that one would like to avoid.

I've tried to make template creation as simple as possible to allow basically anybody to be able to create these templates and to make them almost fully automated. [information on templates and how to make them](https://github.com/amonull/BPM/tree/main/templates)

[For example templates check here](https://github.com/amonull/BPM-Templates)

# Dependecies:
- posix shell (like dash or bash)
- grep
- awk
- whereis
- find
- curl
- git
- install

# Security Risks

Currently there are no restrictions set in place for Version in templates meaning if `{AUTO:*}` is used any command can be ran, there also are no restrictions for build and patches meaning that unwanted changes could be applied to the host system or the desired package.

# Installation

1. `git clone https://github.com/amonull/BPM.git`

2. `cd ./BPM`

3. `./install.sh`

4. `cd .. && rm -rf ./BPM`
