#
# == Class: mcollective::service
#
# Manage the mcollective service
#
class mcollective::service
(
    $ensure,
    $enable

) inherits mcollective::params
{

    service { 'mcollective':
        ensure => $ensure,
        name   => $::mcollective::params::service_name,
        enable => $enable,
    }
}
