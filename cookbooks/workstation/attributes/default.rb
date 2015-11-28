#
# Cookbook: workstation
# Attribute: default
#

default[:workstation][:languages] = %w(go elixir erlang python rust node rebar)
default[:workstation][:devops]    = %w(awscli ansible packer terraform)
default[:workstation][:infosec]   = %w(chkrootkit yara nmap)
default[:workstation][:tools]     = %w(
  ack curl git the_silver_searcher wget htop-osx httpie iperf jq jrnl
  mtr openssl siege sl sqlite ssh-copy-id tmux tree watch youtube-dl
  pass reattach-to-user-namespace
)
default[:workstation][:misc]      = %w(
  ghostscript gnuplot graphviz imagemagick phantomjs pidof
)
default[:workstation][:games]    = %w(vitetris)
default[:workstation][:casks]    = %w(
  adium alfred cloak dropbox gpgtools
  grabbox handbrake iterm2 launchrocket licecap macdown
  mysqlworkbench screenhero skype spotify xquartz vlc wireshark zterm
  openemu
)
default[:workstation][:install_casks] = true

## Removed
# bartender
