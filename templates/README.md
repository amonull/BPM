# Information Outdated
Information here is outdated as of 21<sup>fst</sup> july. after template for bpm is completed this file will also be completed giving information on how to make your own templates.

# Templates explained
Templates have very simple structures sh strucure, it is variable and value. Most variables like dep, url, manpages, libs, uninstall_paths, etc.. are a string var but are treated as a list looping through each element. For example for the URL in ani-cli.template there are 2 URLs one for the executable and the other for the manpage, for this bpm loops through the URL var and installs both onto the same tmpdir and using that tmpdir as a relative path it builds and moves the files into their correct locations for example `ani-cli.1` in manpages var is the same as saying `/tmp/BPM.XXXXXXXXX/ani-cli.1` if `ani-cli.1` was on a dir called man manpages would need to have the value `man/ani-cli.1`.

## How to make a template
templates must have the following:
1. pkg_name.template file holding (case sensitive):
    1. Name
    2. Version
    3. Revision
    5. BPM_deps
    6. Host_deps
    7. URL
    8. Bin_name
    9. Manpages
    10. Libs
    11. Completion
    12. Desktop
    13. Uninstall_paths
2. (optional) build.sh file. Use realtive paths for where everything is installed (i.e. /tmp/BPM.XXXXXXXXX/)
3. (optional) pkg_name.desktop file. Some pkgs provide this file already if that is the case add the url to download for that desktop file in URL and remove {TEMPLATE} from Desktop if {TEMPLATE} is in Desktop the template path will be used
4. (optional) patches. patches in the {TEMPLATE}/patches/* will be applied before building the file and after installing the URLs

Some parameters allow using {TEMPLATE} which allows for BPM to search for the said file using the template path rather than the tmp path. The parameters that allow for that are:
- Manpages
- Completion
- Desktop

This allows for the template creator to make anything that is not provided by whoever makes the package themselves however if the person who makes the package does make it themselves the normal relative tmp path can be used.
