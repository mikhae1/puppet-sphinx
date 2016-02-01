class sphinx (
  $config_admin = $sphinx::params::config_admin,
  $package_ensure = $sphinx::params::package_ensure,
  $config_index_path = $sphinx::params::config_index_path,
  $noodoo_path = $sphinx::params::noodoo_path,
) inherits sphinx::params {
  include sphinx::install
  include sphinx::config
}
