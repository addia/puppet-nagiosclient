# == Class nagiosclient::c_tidy
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
class nagiosclient::c_tidy (
  $c_package_name  = $nagiosclient::c_params::c_package_name
  ) inherits nagiosclient::c_params {

  notify { "## --->>> remove unwanted client packages for: ${c_package_name}": }

  case $::osfamily {
    'RedHat': {
      $tidy_packages = ['samba-libs', 'samba-common-tools']
      package { $tidy_packages:
        ensure         => absent,
        }
      }
    }

  }


# vim: set ts=2 sw=2 et :
