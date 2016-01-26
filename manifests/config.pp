class sphinx::config inherits sphinx {
  file { '/etc/sphinx/conf.d/':
    ensure  => directory,
    owner   => 'sphinx',
    group   => 'sphinx',
    mode    => '0775',
  }

  exec {'Sphinx group membership for the admins':
    unless => "/bin/getent group sphinx|/bin/cut -d: -f4|/bin/grep -q ${config_admin}",
    command => "/usr/sbin/usermod -a -G sphinx ${config_admin}",
    #require => Package["sphinx"],
  }

  file { '/etc/sphinx/sphinx.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => 0644,
    content => template("$module_name/sphinx.conf"),
  }

   file { '/etc/sphinx/indexer.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => 0644,
    content => template("$module_name/indexer.conf"),
  }

  file { '/etc/sphinx/searchd.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => 0644,
    content => template("$module_name/searchd.conf"),
  }

  file { $config_index_path:
    ensure  => directory,
    owner   => 'sphinx',
    group   => 'sphinx',
    mode    => '0775',
  }

 
}
