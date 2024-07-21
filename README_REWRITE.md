# Rewrite TODO list

Everything that needs to be done for the golang rewrite of this program

# Important Additions

- [ ] use libzstd to compress a dict repo file which holds pre-processed templates so that the user does not need to constantly run {AUTO->} sh scripts slowing down performance. And so that the user can install third-party repos if they choose to do (sync should take third-party repos into fact maybe add a file under BPM/repo such as repolist which can have a list of urls to download pre-processed, compressed BPM repos from)

## Hooks

- [ ] Extract hook
- [ ] Install hook
- [ ] Pre/Post-{extract,install} hook (define env params i.e. $XDG_BIN_DIR or other stuff)

# Check List

- [ ] commands and flags (commands for template interactions and download interactions, etc...)
- [ ] options for complex flags and mode switch flags (like bpm make-template \<opts\> \<files\>)
- [ ] can build packages using build instructions
- [ ] can install packages using internal template install instructions (exactly as it is done now in the sh script)
- [ ] can parse/interpet/build templates using complex flag bpm template \<opts\> \<template\>
- [ ] can correctly update packages
- [ ] keeps a compressed list of installed packges with their versions as key value set (key package, value version) (compressed binary file)
- [ ] bpm autofix tools to check all packages for abnormalities and unprecedented changes to report to user (detect corrupt packages)
- [ ] keeps track of each file that has been installed/made/moved to host machine during the build or install stages
- [ ] verbose complex logging
- [ ] better way of building
- [ ] keep files symlinked from ~/.local/share/BPM/repos/pkg
- [ ] compress template folders to use for downloading from other sources. (i.e. online repos, repo data holds name of pkg, version, description, url for compress template folder) these repos can be recived using online servers (i.e. as other pkg managers do it read data from server update local list, or read a git repo to its entirety and generate that information, or download that server data from a git repo)
- [ ] two ways to install packages, one install a file (like a .tar.gz file) from a given url or clone a url (if it ends with .git) .git urls will be cloned .tar.gz (or any known compression file formats) will be unarchived (into a tmp dir) and will be built using the instructions on the template and then moved to places.
- [ ] keep auto versioning (way too comfortable to remove it)
- [ ] more dependency options (host_deps (dependency from host pkg manager), bpm_deps (dependency from bpm), opt_\<host/bpm\>_dep (optional_dependency), build_\<host/bpm\>_dep (dependency required for building package (after build if it will either alert the user to remove the pkg (for host pkg manager) or start dependency removal (for bpm))))
