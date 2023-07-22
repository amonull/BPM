# Templates explained

Templates have a simple structure and the actual `Template` file only holds _variables_ meaning you don't have to write any instructions to get a package to download on your system. The outputted file will have the same name as the `Name` parameter inside the template however more files can be placed around the computer using the `Files` parameter.

## Special Parameter Options

These options alter the pre-determined paths used to add special agnostic values to parameters.

### {BIN}

> Inside Files

Using `{BIN}` inside files assumes a copy of the current binary should be made so using `Files="{BIN}>$HOME/.local/bin/bpm"` like done in `bpm-allow-root` allows the current binary mentioned as `{BIN}` to also be installed as `bpm` into `$HOME/.local/bin/`.

It is recommended to use full paths in files after the arrow (`>`) not doing so may result in unexpected and unwanted behaviour.

> Inside Premissions

Using `{BIN}` inside permissions tells bpm to set the currently installed package to set it to those permissions. The permissions used are numeric and the same as in the `chmod` command meaning 1 would be executable permissions 2 would be write permissions and 4 would be read permissions.

### {TEMPLATE}

Use template relative path instead of the temporary directory relative path.

> supported parameters

- Manpages
- Completions
- Desktop

> Why Files Isn't Supported

I have considered adding this option to files as well however the proposed security risk just seemed too high as it allows the creater of said template to add any file with any premissions anywhere on the computer of the person whose installing the said package using that template, i might consider adding this feature in the future as it may be useful/necessary however currently with everything else that is avaliable i see no reasonable use for this feature considering the security risk it adds.

### {CHECKSUM_METHODS}

This option is only used in the Checksum parameter and whenever a checksum is added the method used for that check sum must also be added.

This option will be treated as a command so its name must be equal to the command name i.e. for md5 sums use `{md5sum}` and for sha256 sums use `{sha256sum}`

> example

{sha256sum}d350ee167d41070bf035238ecab43a5e57840fd19e2e2845e35a0280a6b9c631>bpm

### {AUTO:*}

This option can only be used in the `Version` parameter and makes a template auto-updating.

> example usage

Version="{AUTO:curl -s "https://api.github.com/repos/amonull/BPM/tags}"

usage above shows how tags for releases could be gotten (if they existed for this project. _to be added soon_). Tools like grep, awk, and anything else the user has can also be used to edit the gotten text to get a precise version to compare with currently installed version.

## How To Make Templates

There are three total sections in making a complete template with most being completely optional and avoidable, a fully functional template can be created using only one of three total sections.

The only required section is [Section Seven - Template](#Section-Seven-Template)

### Section One - Patches

All files located in `Patches` dir will be counted as patches, if a patch cannot be used the package will not build.

Patches should be created using the diff tool and should be named as `file-name-you-want-to-patch.patch`

If there are items in `Patches/` that are not files they will be ignored and a warning will be shown on the screen, however the installation will not stop.

### Section Two - build.sh

This file is passed on to `sh` command so it must be designed to work with posix complaint sh if the user has anything else other than bash symlinked to `/bin/sh`.

This file is intended to include only build instructions to create binaries needed for the package, for example running the makefile command when compiling dwm.

This file must be called build.sh _case sensitive_ and must be located at the root of template i.e. `Templates/BPM/build.sh`

build.sh usually only affects the created temporary directory however malicious build files can be created that has unwanted affects on your computer, always read the catted out build.sh shown to you before accepting it.

Since build.sh is called inside the temporary directory it should try to use relative paths.

This file is not required and a package can be built without it.

### Section Three - Template

A template must be at the root of a the template dir i.e. `Templates/BPM/Template` and must have a capital T at the start.

All parameters inside a Template must have capital first letters. Name and name are not the same parameter and will not be treated as such.

> Accepted parameters

1. Name

2. Version

3. Revision

4. URL

5. BPM_deps

6. Host_deps

7. Conflicts

8. Checksum

9. Permissions

10. Manpages

11. Completions

12. Desktop

13. Files

#### Template For Template

TODO

# What Paths Are Used

Unless `{TEMPLATE}` is specified in supported parameters the relative path used is a temporary directory in `/tmp/BPM.XXXXXXXXX/` this means running `./bpm` inside build.sh is equal to running `/tmp/BPM.XXXXXXXXX/bpm` and not whatever path you currently are on. However if `{TEMPLATE}` was used the path used is the same as where that template is.
