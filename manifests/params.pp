class quassel::params {

  $ensure          = 'installed'
  $qt_ensure       = 'installed'
  $gentoo_keywords = undef
  $gentoo_use      = undef
  $service_enabled = true

  case $operatingsystem {
    'gentoo': {
      $pkg_name           = 'net-irc/drupal'
      $service_name       = 'quasselcore'
      $service_hasstatus  = true
      $service_hasrestart = true
    }
    default: { fail("Sorry, $operatingsystem is not supported") }
  }

}
