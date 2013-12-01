class quassel::params {

  $ensure          = 'installed'
  $qt_ensure       = 'installed'
  $gentoo_keywords = undef
  $gentoo_use      = undef
  $service_enabled = true
  $user            = 'quassel'
  $group           = 'quassel'
  $loglevel        = 'info'
  $listen          = '0.0.0.0'
  $port            = '4242'
  $logfile         = '/var/log/quassel.log'

  case $operatingsystem {
    'gentoo': {
      $pkg_name           = 'net-irc/quassel'
      $service_name       = 'quasselcore'
      $service_hasstatus  = true
      $service_hasrestart = true
      $qt_packages        = ['dev-qt/qtcore', 'dev-qt/qtscript', 'dev-qt/qtsql']
      $config_path        = '/etc/conf.d/quasselcore'
      $configdir          = '/var/lib/quassel'
    }
    default: { fail("Sorry, $operatingsystem is not supported") }
  }

}
