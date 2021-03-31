# Manage Microsoft Defender Advanced Threat Protection or Microsoft Defender for Endpoints on Linux 
class mdatp_linux {
  include mdatp_linux::install
  class { mdatp_linux::service:
    service_ensure => 'stopped',
  }
}
