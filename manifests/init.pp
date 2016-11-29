# == Class: nagiosclient
# ===========================
#
#
# Description of the Class:
#
#   Install and configure a Nagios server for WebOps monitoring
#
#
# Document all Parameters:
#
#   Explanation of what this parameter affects and what it defaults to.
#     c_package_name                     = the package name
#     c_user                             = run as user
#     c_group                            = run as group
#     c_userid                           = default uid
#     c_grpuid                           = default gid
#     c_nagios_server                    = nagios_server fqdn
#     c_nagios_server_ip                 = nagios_server ip
#     c_home_dir                         = nagios home directory
#     c_config_dir                       = nagios config directory
#     c_plugin_dir                       = nagios plugin directory
#
# ===========================
#
#
# == Authors
# ----------
#
# Author: Addi <addi.abel@gmail.com>
#
#
# == Copyright
# ------------
#
# Copyright:  ©  2016  LR / Addi.
#
#
class nagiosclient (
  $c_package_name                        = $nagiosclient::c_params::c_package_name,
  $c_user                                = $nagiosclient::c_params::c_user,
  $c_group                               = $nagiosclient::c_params::c_group,
  $c_userid                              = $nagiosclient::c_params::c_userid,
  $c_grpuid                              = $nagiosclient::c_params::c_grpuid,
  $c_nagios_server                       = $nagiosclient::c_params::c_nagios_server,
  $c_nagios_server_ip                    = $nagiosclient::c_params::c_nagios_server_ip,
  $c_config_dir                          = $nagiosclient::c_params::c_config_dir,
  $c_home_dir                            = $nagiosclient::c_params::c_home_dir,
  $c_plugin_dir                          = $nagiosclient::c_params::c_plugin_dir,

  ) inherits nagiosclient::c_params {

    notify { "## --->>> Installing client ${package_name}": }

    anchor { 'nagiosclient::begin': } ->
    class { '::nagiosclient::c_account': } ->
    class { '::nagiosclient::c_install': } ->
    class { '::nagiosclient::c_config': } ->
    class { '::nagiosclient::c_plugins': } ->
    class { '::nagiosclient::c_service': } ->
    anchor { 'nagiosclient::end': }

  }


# vim: set ts=2 sw=2 et :
  
