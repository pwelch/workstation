# Policyfile.rb - Describe how you want Chef to configure your workstation.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

name 'pantry'

# Get cookbooks from supermarket.chef.io
default_source :community

## Run List
run_list(
  'pantry',
  'workstation::mac_os_x',
  'audit-osx'
)

# Add `cookbook` entries for cookbooks that are not found on
# supermarket. See the POLICYFILE_README.md for more information.
cookbook 'workstation', path: 'cookbooks/workstation'
cookbook 'audit-osx', github: 'pwelch/chef-audit-osx'

## Attributes
# packages for OS X
default['homebrew']['taps']    = %w()
default['homebrew']['casks']   = %w()
default['homebrew']['formula'] = %w(git)
# tmate
