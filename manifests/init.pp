class sphinx (
  # this params will be accessible from foreman
  $config_admin       = $sphinx::params::config_admin,
  $package_ensure     = $sphinx::params::package_ensure,
  $config_index_path  = $sphinx::params::config_index_path,
) inherits sphinx::params {
  include sphinx::install
  include sphinx::config
}
