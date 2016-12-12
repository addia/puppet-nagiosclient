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
      $client_packages = ['nagios-plugins-snmp','nagios-plugins-dhcp','nagios-plugins-mysql','nagios-plugins-ssh','nagios-plugins-ping','nagios-plugins-swap','nagios-plugins-check-updates','nagios-plugins-flexlm','nagios-plugins-ircd','nagios-plugins-cluster','nagios-plugins-mrtg','nagios-plugins-ntp','nagios-common','nagios-plugins','nagios-plugins-nrpe','nagios-plugins-wave','nagios-plugins-breeze','nagios-plugins-file_age','nagios-plugins-time','nagios-plugins-http','nagios-plugins-dns','nagios-plugins-oracle','nagios-plugins-procs','nagios-plugins-pgsql','nagios-plugins-nwstat','nagios-plugins-disk','nagios-plugins-tcp','nagios-plugins-nt','nagios-plugins-fping','nagios-plugins-dig','nagios-plugins-sensors','nagios-plugins-ide_smart','nagios-plugins-ldap','nagios-plugins-icmp','nagios-plugins-ifstatus','nagios-plugins-nagios','nagios-plugins-smtp','nagios-plugins-by_ssh','nagios-plugins-log','nagios-plugins-real','nagios-plugins-mrtgtraf','nagios-plugins-dummy','nagios-plugins-rpc','nagios-plugins-load','nagios-plugins-ntp-perl','nagios-plugins-users','nagios-plugins-uptime','nagios-plugins-perl','nagios-plugins-mailq','nagios-plugins-hpjd','nagios-plugins-ups','nagios-plugins-game','nagios-plugins-overcr','perl-Data-Dumper','nrpe']
      }
    'Archlinux': {
      $client_packages = ['perl-sys-statistics-linux','perl-universal-require','monitoring-plugins','percona-nagios-plugins','nagios-nrpe-plugin','nrpe','perl-data-dumper-concise']
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
        source   => 'ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/csbuild:/Perl/CentOS_CentOS-6/noarch/perl-Sys-Statistics-Linux-0.66-1.1.noarch.rpm',
#       source   => "puppet:///modules/nagiosclient/perl-Sys-Statistics-Linux-0.66-1.1.noarch.rpm",
        require  => Package['perl-Data-Dumper']
        }
      }
    }

  }


# vim: set ts=2 sw=2 et :
