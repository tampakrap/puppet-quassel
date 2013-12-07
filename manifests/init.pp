class quassel (
  $pkg_name           = $quassel::params::pkg_name,
  $ensure             = $quassel::params::ensure,
  $gentoo_keywords    = $quassel::params::keywords,
  $gentoo_use         = $quassel::params::use,
  $service_name       = $quassel::params::service_name,
  $service_enabled    = $quassel::params::service_enabled,
  $service_hasstatus  = $quassel::params::service_hasstatus,
  $service_hasrestart = $quassel::params::service_hasrestart,
  $qt_packages        = $quassel::params::qt_packages,
  $qt_ensure          = $quassel::params::qt_ensure,
  $config_path        = $quassel::params::config_path,
  $log_level           = $quassel::params::log_level,
  $listen             = $quassel::params::listen,
  $port               = $quassel::params::port,
  $user               = $quassel::params::user,
  $group              = $quassel::params::group,
  $configdir          = $quassel::params::configdir,
  $logfile            = $quassel::params::logfile,
) inherits quassel::params {

  include quassel::install
  include quassel::service
  include quassel::config

}
