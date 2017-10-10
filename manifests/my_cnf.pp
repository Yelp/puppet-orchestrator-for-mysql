#
class orchestrator::my_cnf inherits orchestrator {
  if $orchestrator::write_creds {
    $topology_erb = 'orchestrator/topology_creds.cnf.erb'
    $srv_erb = 'orchestrator/srv_creds.cnf.erb'

    file { $orchestrator::topology_cnf:
      path    => $orchestrator::top_path,
      content => template($topology_erb),
      mode    => '0644',
    }
    file { $orchestrator::srv_cnf:
      path    => $orchestrator::srv_path,
      content => template($srv_erb),
      mode    => '0644',
    }
  }
}
