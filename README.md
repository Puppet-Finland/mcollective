# mcollective

A Puppet module for managing mcollective. Currently this only allows package and 
service management. For more complex use-cases please use other modules such as 
[puppetlabs/mcollective](https://forge.puppet.com/puppet/mcollective).

# Module usage

Usage from manifest when using Puppetlabs packages:

    class { '::mcollective':
      package_ensure => 'absent',
      service_ensure => 'stopped',
      service_enable => 'false',
    }

This ensures mcollective is stopped and not enabled on boot. The package_ensure 
parameter is set 'absent' because mcollective is contained within the 
'puppet-agent' package, and we don't want to install the distribution's own 
version of mcollective.

For further details please refer to [init.pp](manifests/init.pp).
