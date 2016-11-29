# == Class nagiosclient::c_config
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
class nagiosclient::c_config (
  $c_package_name      = $nagiosclient::c_params::c_package_name,
  $c_user              = $nagiosclient::c_params::c_user,
  $c_group             = $nagiosclient::c_params::c_group,
  $c_config_dir        = $nagiosclient::c_params::c_config_dir,
  $c_plugin_dir        = $nagiosclient::c_params::c_plugin_dir,
  $c_nagios_server_ip  = $nagiosclient::c_params::c_nagios_server_ip,
  ) inherits nagiosclient::c_params {

  notify { "## --->>> Updating client config files for: ${c_package_name} ": }

  # With selinux, some nrpe plugins require additional rules to work
  #if $selinux and $::selinux_enforced {
  #  selinux::audit2allow { 'nrpe':
  #    source          => "puppet:///modules/${module_name}/messages.nrpe",
  #    }
  #  }

  # put the command file for nrpe in place
  file { "${c_config_dir}/nrpe.cfg":
    ensure       => file,
    owner        => 'root',
    group        => 'root',
    mode         => '0644',
    replace      => true,
    content      => template('nagiosclient/nrpe.cfg.erb'),
    notify       => Service['nrpe'],
    }

  # put the pid config file for nrpe in place:
  file { '/usr/lib/tmpfiles.d/nrpe.conf':
    ensure       => 'file',
    path         => '/usr/lib/tmpfiles.d/nrpe.conf',
    owner        => 'root',
    group        => 'root',
    mode         => '0644',
    replace      => true,
    content      => template('nagiosclient/nrpe.conf.erb'),
    notify       => Service['nrpe']
    }

  # put the service file for nrpe in place:
  systemd::unit_file { 'nrpe.service':
    content      => template('nagiosclient/nrpe.service.erb'),
    }

  # remove the redundant user
  user { 'nrpe':
    ensure       => 'absent',
    }

  }


# vim: set ts=2 sw=2 et :
