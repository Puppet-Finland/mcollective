# == Class: mcollective
#
# This class sets up mcollective
#
# Currently functionality is limited to installing or removing the package.
#
# == Parameters
#
# [*manage*]
#   Whether to manage mcollective using Puppet. Valid values are true (default) 
#   and false.
# [*package_ensure*]
#   Status of the mcollective package. If you're using Puppetlabs package 
#   repositories then mcollective gets pulled in in the 'puppet-agent' package, 
#   in which case the default value of 'absent' is the correct choice. If you 
#   want or need to use operating system's Puppet / MCollective packages, then 
#   set this parameter to 'present'.
# [*service_ensure*]
#   The status of the mcollective service. Valid values are 'running' / 'true' 
#   and 'stopped' / 'false'. This parameter can be left undefined to not manage 
#   the service status at all.
# [*service_enable*]
#   Enable the mcollective service. Valid values are the same as for the Puppet 
#   Service resource, that is, 'enabled' (default), 'disabled', 'manual' and 
#   'mask'.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class mcollective
(
    $manage = true,
    $package_ensure = 'absent',
    $service_ensure = undef,
    $service_enable = 'enabled'

) inherits mcollective::params
{

validate_bool($manage)
validate_re("${package_ensure}", '^(present|absent)$')

if $manage {
    class { '::mcollective::install':
        ensure => $package_ensure,
    }

    class { '::mcollective::service':
        ensure => $service_ensure,
        enable => $service_enable,
    }
}
}
