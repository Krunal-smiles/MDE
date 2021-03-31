class mdatp_linux::config {
  file { '/etc/opt/microsoft/mdatp/managed/mdatp_managed.json':
    source  => 'puppet://modules/mdatp_linux/mdatp_managed.json',
    owner   => root,
    group   => root,
    mode    => '0644',
  }
} 
