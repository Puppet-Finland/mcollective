#
# == Class: mcollective::service
#
# Manage the mcollective service
#
class mcollective::service
(
    Variant[Boolean, Enum['running', 'stopped']] $ensure,
    Boolean                                      $enable

) inherits mcollective::params
{

    service { 'mcollective':
        ensure => $ensure,
        name   => $::mcollective::params::service_name,
        enable => $enable,
    }
}
