#
# Cookbook: workstation
# Attribute: default
#

default[:workstation][:languages] = %w(go elixir erlang python rust node rebar)
default[:workstation][:devops]    = %w(awscli ansible packer terraform)
default[:workstation][:infosec]   = %w(chkrootkit yara nmap zmap)
default[:workstation][:tools]     = %w(
  ack curl git the_silver_searcher wget htop-osx httpie iperf jq jrnl
  mtr openssl siege sl sqlite ssh-copy-id tmux tree watch youtube-dl
  pass reattach-to-user-namespace newsbeuter links
)
default[:workstation][:misc]      = %w(
  ghostscript gnuplot graphviz imagemagick phantomjs pidof irssi
)
default[:workstation][:games]    = %w(vitetris nethack)
default[:workstation][:casks]    = %w(
  adium alfred cloak dropbox gpgtools
  grabbox handbrake iterm2 launchrocket licecap macdown
  mysqlworkbench screenhero skype spotify xquartz vlc zterm
  openemu cyberduck
)
default[:workstation][:install_casks] = true

## Removed
# bartender
# wireshark
