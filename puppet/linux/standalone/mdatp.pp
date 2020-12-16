yumrepo { 'microsoftpackages' :
  baseurl  => 'https://packages.microsoft.com/rhel/7.4/prod',
  descr    => 'packages-microsoft-com-prod',
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc'
}

file { ['/etc/opt', '/etc/opt/microsoft', '/etc/opt/microsoft/mdatp', '/etc/opt/microsoft/mdatp/managed']:
  ensure => directory,
  owner  => root,
  group  => root,
  mode   => '0755'
}

file { '/etc/opt/microsoft/mdatp/mdatp_onboard.json':
  source  => '~/mdatp_onboard.json',
  owner   => root,
  group   => root,
  mode    => '0644',
  require => File['/etc/opt/microsoft/mdatp']
}

package { 'mdatp':
  ensure  => 'installed',
  require => File['/etc/opt/microsoft/mdatp/mdatp_onboard.json'],
  before  => Service['mdatp']
}

file { '/etc/opt/microsoft/mdatp/managed/mdatp_managed.json':
  source  => '~/mdatp_managed.json',
  owner   => root,
  group   => root,
  mode    => '0644',
  require => File['/etc/opt/microsoft/mdatp/managed'],
  before  => Service['mdatp'],
  notify  => Service['mdatp']
}

file { '/lib/systemd/system/mdatp.service':
  source  => '~/mdatp.service',
  owner   => root,
  group   => root,
  mode    => '0644',
  require => File['/lib/systemd/system'],
  before  => Service['mdatp'],
  notify  => Service['mdatp']
}

service { 'mdatp' :
  ensure  => 'running',
  enable  => 'true',
  require =>[Package['mdatp'],File['/lib/systemd/system/mdatp.service']]
}

cron { 'mdatp-pkg-update' :
  ensure      => 'present',
  command     => 'yum update mdatp',
  environment => [''],
  hour        => 12,
  minute      => 0
}

cron { 'mdatp-sig-update' :
  command     => 'mdatp definitions update',
  environment => [''],
  hour        => 12,
  minute      => 0
}
