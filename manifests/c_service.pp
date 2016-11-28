# == Class nagiosclient::c_service
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
class nagiosclient::c_service (
  $c_package_name  = $nagiosclient::c_params::c_package_name
  ) inherits nagiosclient::c_params {
  
  notify { "## --->>> Configuring client service for: ${c_package_name}": } ~>

  service { 'nrpe':
    ensure         => running,
    enable         => true,
    }

  }


# vim: set ts=2 sw=2 et :
