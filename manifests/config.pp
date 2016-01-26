class sphinx::config inherits sphinx {
  file { '/etc/sphinx/conf.d/':
    ensure  => directory,
    owner   => 'sphinx',
    group   => 'sphinx',
    mode    => '0775',
    # content => template($config_template),
  }
}
