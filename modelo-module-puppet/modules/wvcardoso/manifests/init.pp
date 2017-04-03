class wvcardoso (
  $install,
  $users,
  $pwd_root,
){

  package { $install:
    ensure => installed,
  }

  user { $users:
    ensure => present,
  }

  class { 'wvcardoso::linux::root':
   password => $pwd_root,
  }

}
