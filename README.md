# pwelch-workstation

Resources for setting up workstation and dotfiles

This is a personal fork of the [Chef Pantry Project](https://github.com/chef/pantry-chef-repo)

## Usage

Run:
```
sudo ./bin/pantry
```

To perform the installation and run Chef with the default Policyfile.rb, use the `-c` option.

```
sudo ./bin/pantry -c
```

### Installing Packages

`./bin/pantry` will use the Policyfile.rb to add these attributes to the node. Then update the Policyfile.lock.json and export the repository.

```
chef update
chef export --force zero-repo
sudo chef-client -z
```

### Issues

Need to fix the bootstrap script. If `$HOME/.chefdk` is owned by root, the permissions need to be fixed or chef will not work. `sudo chown -R $USER $HOME/.chefdk/`

Fixes for OS X 10.11
- https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/El_Capitan_and_Homebrew.md
- sudo chown -R $(whoami):admin /usr/local
- sudo chown -R $USER /Library/Caches/Homebrew/
