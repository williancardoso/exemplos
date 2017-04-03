class serpro::linux::root (
  $password = undef,
){
  user { 'root':
    password => $password,
  }
}
