# workstation

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

Packages are installed by populating attribute arrays with a list of names to install. For OS X, these are handled by the `homebrew` cookbook's formulas and casks attributes. For Windows, these are handled by Chocolatey.

Update the Policyfile.rb attributes to modify the package lists you want to install.

```ruby
default['homebrew']['formulas'] = %w(coreutils go postgresql)
default['homebrew']['casks'] = %w(google-chrome skype vagrant)
```

`./bin/pantry` will use the Policyfile.rb to add these attributes to the node. Then update the Policyfile.lock.json and export the repository.

```
chef update
chef export --force zero-repo
sudo chef-client -z
```

### Using a Chef Server

**This is optional**.

Pantry can be used with a Chef Server. Since this isn't the default, it does require a little more work on your part. For this example, I'll use Hosted Chef as my server.

**Note** Don't use `-c` with the `bin/pantry` script. It assumes running `chef-client` with local mode.

Before running `chef-client`, do the following:

Create `/etc/chef/client.rb` with at least the following content, and copy your organization's validation client key (`ORGNAME-validator.pem`) to `/etc/chef/validation.pem`.

```ruby
chef_server_url 'https://api.opscode.com/organizations/ORGNAME'
validation_client_name 'ORGNAME-validator'
```

Create `.chef/knife.rb` or `~/.chef/knife.rb` with the following content. Replace ORGNAME and HOSTED_USERNAME with your values.

```ruby
chef_server_url 'https://api.opscode.com/organizations/ORGNAME'
node_name 'HOSTED_USERNAME'
client_key 'path/to/your/HOSTED_USERNAME.pem'
use_policyfile true
deployment_group 'pantry-chef-server'
versioned_cookbooks true
```

Obtain the validation client key from your Chef Server. For example, I downloaded mine from the Hosted Chef starter kit. Copy it to `/etc/chef`.

Upload the cookbooks from this repository.

```
chef install
chef push
```

Run Chef!

```
sudo chef-client
```

## bin/pantry

The `pantry` script takes 0 or 1 argument. It does the following:

1. Install ChefDK using CHEF's installation script that downloads the package with the [Omnitruck API](https://docs.chef.io/api_omnitruck.html).
1. "Vendors" the required cookbooks into `zero-repo` using Chef Policyfiles.
1. Optionally runs `chef-client` (using "local mode") with the `base` role in this repository if the `-c` argument is used.

For more information about Policyfiles, see its [README](https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md).

