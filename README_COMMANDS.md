# Main Commands:

- [ ] template (for interaction with templates)
- [ ] pkg (for interaction with packages)
- [ ] repair (check package and template for errors using check sums and file_info file inside the package (runs for both pkg and template))


# Template Sub Commands:

- [ ] list (list all templates)
- [ ] print (for debugging prints all values interpeted by BPM)


# Template Print Sub Sub Commands:

- [ ] download (downloads a template from a given url (make specific build for this like bpm_build (i.e. another template)))
- [ ] remove (removes a template from the system)
- [ ] build (prints build file)
- [ ] patch (prints all patches)
- [ ] parameter_names (parameter_names is a place holder this is more like version which prints that given parameter name)


# Pkg Sub Commands:

- [ ] download (download a package)
- [ ] remove (remove a package)
- [ ] update (update a package with a new given template (i.e. replace all files with newer versions))
- [ ] check (checks for updates)
- [ ] search (searches for packages inside a repo)
- [ ] list (list all installed packages)


# Flags to template
- [ ] -r, --repo (uses a different path for template path)


# Flags for pkg

- [ ] -y, --yes (to automatically say yes to all prompts)
- [ ] -n, --no (to automatically say no to all prompts)
- [ ] -s, --no-shell (does not perform shell actions for building package or getting package versions (runs pure go no sh))
- [ ] -p, --print (prints the build file and patch info and asks for confirmation before running)
- [ ] -B, --bin-dir (changes the path for placing binaries)
- [ ] -b, --bin-name (creates another binary but with this new given name)
- [ ] -r, --repo (uses a different path for template path)
- [ ] -m, --man-path (changes path for manpages)
- [ ] -c, --completion-path (changes path for sh completions)
- [ ] -d, --desktop-path (changes path for desktop files)
- [ ] -I, --ignore-deps (ignores dependecny checking)
- [ ] -C, --ingore-conflict (ignores conflict checking)


# Flags for repair

- [ ] -t, --skip-template (skips repair for template)
- [ ] -p, --skip-pkg (skips repair for package)
- [ ] -n, --no-suggestions (gives no suggestions)
- [ ] -f, --fix (attempts to fix problems with given suggestions (i.e. replace files with the ones in the template))
