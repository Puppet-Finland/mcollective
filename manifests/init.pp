# == Class: mcollective
#
# This class sets up mcollective
#
# == Parameters
#
# [*manage*]
#   Whether to manage mcollective using Puppet. Valid values are true (default) 
#   and false.
# [*service_ensure*]
#   The status of the mcollective service. Valid values are 'running' / 'true' 
#   and 'stopped' / 'false'. This parameter can be left undefined to not manage 
#   the service status at all.
# [*service_enable*]
#   Enable the mcollective service. Valid values are true (default) and false.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class mcollective
(
    Boolean $manage = true,
            $service_ensure = undef,
            $service_enable = true

)
{

if $manage {

    include ::puppetlabs

    class { '::mcollective::service':
        ensure => $service_ensure,
        enable => $service_enable,
    }
}
}
