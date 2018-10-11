#
class orchestrator::params {

  $configs_dir       = '/etc/orchestrator/'
  $config            = 'orchestrator.conf.json'
  $config_template   = 'orchestrator/orchestrator.conf.json.erb'
  $package_ensure    = 'present'
  $package_manage    = true
  $package_name      = [ 'orchestrator' ]
  $repo_manage       = false
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $service_name      = 'orchestrator'
  $srv_cnf           = 'srv_creds.cnf'
  $srv_user          = 'orchestrator'
  $srv_pass          = '' 
  $topology_cnf      = 'topology_creds.cnf'
  $topology_user     = 'orchestrator'
  $topology_pass     = ''
  $metadb_host       = 'localhost'
  $write_creds       = true
  $owner             = 'root'
  $group             = 'root'
}
