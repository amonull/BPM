# BPM
so far this program is incomplete however any improvements or suggestions is more than welcom.

[Information on templates and how to make them](https://github.com/amonull/BPM/tree/main/templates)

For BPM to install any packages or to update them bpm must be on path as it makes calls to itself frequently for some functionality.

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

# Security Risks

BPM too permissive in version, build and patches

# TODO

- [ ] fix `{AUTO:*}` in `Version`
- [ ] finish flag usage
- [x] create the remove functionality
- [x] create updating functionality
- [x] create searching functionality
- [ ] add colors to \[ERR\] \[INFO\] \[WARNING\] by using printf
- [x] make bpm deps downloaded and removed by bpm
- [ ] Add a new ui with fzf that allows users to for packages in said paths.
- [ ] After new ui is added create a .desktop file to be able to run it as a dekstop application.
