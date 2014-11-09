# Puppet configurations

Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

stage { 'first': before => Stage['main'] }
stage { 'last': require => Stage['main'] }


node default {
  class { 'bootstrap': stage => 'first' }
  class { 'other': stage => 'main' }
  class { 'mysql': stage => 'main' }
}


