# mcollective

A Puppet module for managing mcollective. Currently this only allows package and 
service management.

# Module usage

Usage from Hiera when using Puppetlabs packages:

    classes:
        - mcollective
    
    mcollective::package_ensure: 'absent'
    mcollective::service_ensure: 'stopped'
    mcollective::service_enable: 'false'

This ensures mcollective is stopped and not enabled on boot. The package_ensure 
parameter is set 'absent' because mcollective is contained within the 
'puppet-agent' package, and we don't want to install the distribution's own 
version of mcollective.

For further details please refer to the class documentation:

* [Class: mcollective](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Ubuntu 14.04

Any *NIX-style operating system should work out of the box or with small 
modifications.

For details see [params.pp](manifests/params.pp).
