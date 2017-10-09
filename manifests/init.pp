#
# MySQL orchestrator: For managing replication and failover.
#
class orchestrator (
  $config            = $orchestrator::params::config,
  $config_override   = {},
  $config_template   = $orchestrator::params::config_template,
  $configs_dir       = $orchestrator::params::configs_dir,
  $package_ensure    = $orchestrator::params::package_ensure,
  $package_manage    = $orchestrator::params::package_manage,
  $package_name      = $orchestrator::params::package_name,
  $repo_manage       = $orchestrator::params::repo_manage,
  $service_enable    = $orchestrator::params::service_enable,
  $service_ensure    = $orchestrator::params::service_ensure,
  $service_manage    = $orchestrator::params::service_manage,
  $service_name      = $orchestrator::params::service_name,
  $topology_cnf      = $orchestrator::params::topology_cnf,
  $topology_user     = $orchestrator::params::topology_user,
  $topology_pass     = $orchestrator::params::topology_pass,
  $srv_cnf           = $orchestrator::params::srv_cnf,
  $srv_user          = $orchestrator::params::srv_user,
  $srv_pass          = $orchestrator::params::srv_pass,
  $metadb_host       = $orchestrator::params::metadb_host,
  $write_creds       = $orchestrator::params::write_creds,
) inherits orchestrator::params {

  validate_absolute_path($configs_dir)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_bool($package_manage)
  validate_array($package_name)
  validate_bool($repo_manage)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  $config_path = "${configs_dir}${config}"
  $srv_path    = "${configs_dir}${srv_cnf}"
  $top_path    = "${configs_dir}${topology_cnf}"

  file { 'orch-dir':
      path => $configs_dir,
      ensure => directory,
      mode => '0644',
  }
  
  # Using anchor pattern based on known issue:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'orchestrator::begin': } ->
  class { '::orchestrator::repo': } ->
  class { '::orchestrator::install': } ->
  class { '::orchestrator::config': } ~>
  class { '::orchestrator::my_cnf': } ~>
  class { '::orchestrator::service': } ->
  anchor { 'orchestrator::end': }

}
