#
# Cookbook: workstation
# Attribute: default
#

default[:workstation][:languages] = %w(go elixir erlang python rust node rebar)
default[:workstation][:devops]    = %w(ansible packer terraform)
default[:workstation][:infosec]   = %w(chkrootkit yara nmap)
default[:workstation][:tools]     = %w(
  ack curl git the_silver_searcher wget htop-osx httpie iperf jq jrnl
  mtr openssl siege sl sqlite ssh-copy-id tmux tree watch youtube-dl
  reattach-to-user-namespace
)
default[:workstation][:misc]      = %w(
  ghostscript gnuplot graphviz imagemagick phantomjs pidof
)
default[:workstation][:games]    = %w(vitetris)
default[:workstation][:casks]    = %w(
  adium alfred bartender cloak dropbox gpgtools
  grabbox handbrake iterm2 launchrocket licecap
  mysqlworkbench screenhero skype spotify xquartz vlc wireshark zterm
)
default[:workstation][:install_casks] = true
