class quassel::install {

  include quassel

  if $quassel::qt_packages {
    package { $quassel::qt_packages:
      ensure => $quassel::qt_ensure,
      before => Package['quassel'],
    }
  }

  if $::osfamily == 'Gentoo' {
    if $quassel::gentoo_keywords {
      package_keywords { $quassel::pkg_name:
        keywords => $quassel::gentoo_keywords,
        target   => 'quassel',
        before   => Package['quassel'],
      }
    }
    if $quassel::gentoo_use {
      package_use { $quassel::pkg_name:
        use    => $quassel::gentoo_use,
        target => 'quassel',
        before => Package['quassel'],
      }
    }
  }

  package { 'quassel'
    name   => $quassel::pkg_name,
    ensure => $quassel::ensure,
    notify => Service['quassel'],
  }

}
