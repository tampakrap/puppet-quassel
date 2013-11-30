class quassel::config {

  include quassel

  file { 'quassel_config':
    path     => $quassel::config_path,
    template => template("${module_name}/config.erb")
    require  => Package['quassel'],
    notify   => Service['quassel'],
  }

  file { $quassel::configdir:
    user    => $quassel::user,
    group   => $quassel::group,
    mode    => 0750,
    require => Package['quassel'],
  }

}