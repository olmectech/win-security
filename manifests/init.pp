# == Class: security 
#
define notify_keys($key, $value) {

    notify { "currently looping server hostname $key": }

  file { "/var/tmp/$key":
    ensure => present,
    }

  file { "/var/tmp/$value":
    ensure => present,
    }
  }

class security {
  $keys = hiera("keys")
    create_resources( notify_keys, $keys )
}
