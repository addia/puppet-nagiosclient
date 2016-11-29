# == Class nagiosclient::c_install
# ===========================
#
#
# Description of the Class:
#
#   This class is meant to be called from init.pp only.
#
#
# ===========================
#
class nagiosclient::c_install (
  $c_package_name = $nagiosclient::c_params::c_package_name
  ){

  notify { "## --->>> Installing plugins for package: ${c_package_name}":
  }

  case $::osfamily {
    'RedHat': {
      $client_packages = ['nagios-plugins-all','nagios-plugins-check-updates','nagios-plugins-ifstatus','nagios-plugins-uptime','nagios-plugins-nrpe','nrpe', 'perl-Data-Dumper']
      }
    'Archlinux': {
      $client_packages = ['perl-sys-statistics-linux','perl-universal-require','percona-nagios-plugins','nagios-nrpe-plugin','nrpe','perl-data-dumper-concise']
      }
    }
  package { $client_packages :
    ensure => latest,
    }

  case $::osfamily {
    'RedHat': {
      package { 'perl-Sys-Statistics-Linux':
        ensure   => 'installed',
        provider => 'rpm',
        source   => "puppet:///modules/nagiosclient/perl-Sys-Statistics-Linux-0.66-1.1.noarch.rpm",
        require  => Package['perl-Data-Dumper']
        }
      }
    }

  }


# vim: set ts=2 sw=2 et :
