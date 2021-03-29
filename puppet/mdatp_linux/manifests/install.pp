class mdatp_linux::install {
  $osfamily = $facts['os']['family']
  $version = $facts['os']['release']['major']
  $channel = 'prod'
  $distro = downcase($facts['os']['name'])

  case $osfamily {
    'Debian' : {
      apt::source { 'microsoftpackages':
        location => "https://packages.microsoft.com/${distro}/${version}/${channel}",
        release  => $facts['os']['distro']['codename'],
        architecture => 'amd64,armhf,arm64',
        repos    => 'main',
        key      => {
          'id'     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
          'server' => 'keyserver.ubuntu.com',
        },
      }
    }
    'RedHat' : {
      yumrepo { 'microsoftpackages':
      	baseurl  => 'https://packages.microsoft.com/rhel/${version}/${channel}',
        descr    => 'packages-microsoft-com-${channel}',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc'
      }
    }
  }
  
  package { 'mdatp':
    ensure  => 'installed',
    #before  => Service['mdatp']
  }

  #service { 'mdatp':
  #  ensure  => 'stopped',
  #  enable  => 'true',
  #  require => Package['mdatp']
  #}
}
