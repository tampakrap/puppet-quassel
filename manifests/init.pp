class quassel (
  $pkg_name           = $quassel::params::pkg_name,
  $ensure             = $quassel::params::ensure,
  $gentoo_keywords    = $quassel::params::keywords,
  $gentoo_use         = $quassel::params::use,
  $service_name       = $quassel::params::service_name,
  $service_enabled    = $quassel::params::service_enabled,
  $service_hasstatus  = $quassel::params::service_hasstatus,
  $service_hasrestart = $quassel::params::service_hasrestart,
  $qt_ensure          = $quassel::params::qt_ensure,
) inherits quassel::params {

  portage::package { ['dev-qt/qtcore', 'dev-qt/qtscript', 'dev-qt/qtsql']:
    ensure => $qt_ensure,
  }

  portage::package { $pkg_name:
    ensure   => $ensure,
    use      => $gentoo_use,
    keywords => $gentoo_keywords,
    target   => 'quassel',
  }

  include quassel::service

}
