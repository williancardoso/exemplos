
file { '/root/puppet_teste.txt':
  ensure  => file,
  mode    => '0644',
  content => "BLA BLA BLA BLA",
}
