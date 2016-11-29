# == Class nagiosclient::c_account
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
class nagiosclient::c_account (
  $c_package_name   = $nagiosclient::c_params::c_package_name,
  $c_user           = $nagiosclient::c_params::c_user,
  $c_group          = $nagiosclient::c_params::c_group,
  $c_uid            = $nagiosclient::c_params::c_uid,
  $c_guid           = $nagiosclient::c_params::c_guid,
  $c_home_dir       = $nagiosclient::c_params::c_home_dir
  ) inherits nagiosclient::c_params {

  notify { "## --->>> Creating client accounts for: ${c_package_name}": }

  # ensure hone directory exists
  file { $c_home_dir :
    ensure        => directory,
    owner         => $c_user,
    group         => $c_group,
    mode          => '0755'
    }

  group { $c_group:
    ensure          => 'present',
    gid             => $c_guid,
    }

  user { $c_user: 
    ensure          => 'present',
    home            => $c_home_dir,
    uid             => $c_uid,
    gid             => $c_guid,
    password        => '!',
    require         => Group["$c_group"]
    }

  file { '/etc/sudoers.d/20-nagios' :
    ensure          => file,
    owner           => 'root',
    group           => 'root',
    mode            => '0644',
    source          => "puppet:///modules/nagiosclient/20-nagios",
    }

  }


# vim: set ts=2 sw=2 et :
