#
# == Class: mcollective::params
#
# Defines some variables based on the operating system
#
class mcollective::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'mcollective'
            $service_name = 'mcollective'
        }
        'Debian': {
            $package_name = 'mcollective'
            $service_name = 'mcollective'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
