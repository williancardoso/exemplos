class apache_wrapper (
  
  $version = undef,

){

  notify { $version: }

  #include ::apachedd
  #include ::apache::mod::php

  #apache::vhost { $::fqdn:
  #  port      => '80',
  #  priority  => '00',
  #}


}
