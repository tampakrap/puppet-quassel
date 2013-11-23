class quassel::service {

  include quassel

  service { 'quassel':
    name       => $quassel::service_name,
    ensure     => $quassel::service_enabled ? {true => running, false => stopped },
    hasstatus  => $quassel::service_hasstatus,
    hasrestart => $quassel::service_hasrestart,
    enable     => $quassel::enabled,
  }

}
