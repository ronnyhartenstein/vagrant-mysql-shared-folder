# https://github.com/Mayflower/vagrant-percona/blob/master/modules/mysql/manifests/init.pp

class mysql {

  package { "mysql-server-5.6":
    ensure => present,
    require => Exec["apt-get update"],
    install_options => "--force-yes"
  }

  package { "mysql-client-5.6":
    ensure => present,
    require => Exec["apt-get update"]
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server-5.6"],
  }

  file {
    'my.cnf':
    ensure => file,
    source => "puppet:///modules/mysql/my.cnf",
    path => '/etc/mysql/my.cnf',
    mode => 644,
    owner => root,
    group => root,
    notify => Service['mysql'],
    require => [Package["mysql-server-5.6"]]
  }

}