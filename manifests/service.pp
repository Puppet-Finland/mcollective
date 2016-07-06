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

    # Disable the service in /etc/default/mcollective on Debian-based distros.
    # Without this every mcollective package upgrade will re-enable mcollectived
    # temporarily. On systems with systemd this is probably not required, but
    # seems harmless.
    if $::osfamily == 'Debian' {
        $default_file = '/etc/default/mcollective'

        ini_setting { 'mcollective-start':
            ensure  => 'present',
            path    => $default_file,
            setting => 'START',
            value   => bool2str($enable),
        }
    }
}
