class sphinx::install inherits sphinx {
  yumrepo { 'sphinx':
    baseurl => "http://uds-puppet.moscow.eurochem.ru/sphinx/${operatingsystem}/${operatingsystemmajrelease}/${architecture}",
    descr => 'Eurochem Sphinx Repository',
    enabled => 1,
    gpgcheck => 0,
  }

  package { 'sphinx':
    ensure => $package_ensure,
    require => yumrepo['sphinx'],
    before => Class['sphinx::config'],
  }
}
