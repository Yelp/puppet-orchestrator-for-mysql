# Manage the packagecloud repo's
class orchestrator::repo inherits orchestrator {
  if $orchestrator::repo_manage {
    include packagecloud

    case $facts['os']['name'] {
      'Debian', 'Ubuntu': {
        packagecloud::repo { 'github/orchestrator':
          type => 'deb',
        }
      }
      'Fedora', 'CentOS', 'RedHat': {
        packagecloud::repo { 'github/orchestrator':
          type => 'rpm',
        }
      }
      default: {
        fail("Operating system ${facts['os']['name']} was not supported for adding repo's")
      }
    }
  }

}
