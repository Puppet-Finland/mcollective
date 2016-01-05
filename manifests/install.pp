# == Class: mcollective::install
#
# This class installs mcollective
#
class mcollective::install
(
    $ensure

) inherits mcollective::params
{
    package { $::mcollective::params::package_name:
        ensure => $ensure,
    }
}
