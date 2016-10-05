# == Class nagiosclient::params
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
class nagiosclient::params {

  $package_name                        = 'nagios-client'
  $user                                = 'nagios'
  $group                               = 'nagios'
  $uid                                 = '240'
  $guid                                = '240'
  $home_dir                            = '/var/spool/nagios'

  }


# vim: set ts=2 sw=2 et :
