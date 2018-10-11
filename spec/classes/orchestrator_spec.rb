require 'spec_helper'
describe 'orchestrator' do

  context 'verify module' do

    it 'does contain anchor orchestrator::begin ' do
      should contain_anchor('orchestrator::begin')
    end

    it 'does contain directory /etc/orchestrator' do
      should contain_file('orch-dir').with({
        :ensure => 'directory',
        :owner   => 'root',
        :group   => 'root',
        :path   => '/etc/orchestrator/',
        :mode   => '0644',
      })
    end

    it 'does contain class orchestrator::repo' do
      should contain_class('orchestrator::repo')
    end

    it 'does contain class orchestrator::install' do
      should contain_class('orchestrator::install')
    end

    it 'does contain class orchestrator::config' do
      should contain_class('orchestrator::config')
    end

    it 'does contain file orchestrator.conf.json' do
      should contain_file('orchestrator.conf.json').with({
        :ensure  => 'file',
        :owner   => 'root',
        :group   => 'root',
        :path    => '/etc/orchestrator/orchestrator.conf.json',
        :mode    => '0644',
      })
    end

    it 'does contain class orchestrator::my_cnf' do
      should contain_class('orchestrator::my_cnf')
    end

    it 'does contain file topology_creds.cnf' do
      should contain_file('topology_creds.cnf').with({
        :path    => '/etc/orchestrator/topology_creds.cnf',
        :mode    => '0644',
        :content => "[client]\nuser=orchestrator\npassword=\n"
      })
    end

    it 'does contain file srv_creds.cnf' do
      should contain_file('srv_creds.cnf').with({
        :path    => '/etc/orchestrator/srv_creds.cnf',
        :mode    => '0644',
        :content => "[client]\nuser=orchestrator\npassword=\n"
      })
    end

    it 'does contain class orchestrator::service' do
      should contain_class('orchestrator::service')
    end

    it 'does contain anchor cassandra::end ' do
      should contain_anchor('orchestrator::end')
    end
  end
end
