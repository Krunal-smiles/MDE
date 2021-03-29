class mdatp_linux::service (
  Enum['running', 'stopped'] $service_ensure, 
){
  service { 'mdatp':
    ensure  => $service_ensure,
    enable  => 'true',
    require => Package['mdatp']
  }
}
