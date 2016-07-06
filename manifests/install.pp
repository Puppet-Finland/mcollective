# == Class: mcollective::install
#
# This class installs mcollective
#
class mcollective::install
(
    Enum['present', 'absent', 'latest'] $ensure

) inherits mcollective::params
{
    package { $::mcollective::params::package_name:
        ensure => $ensure,
    }
}
