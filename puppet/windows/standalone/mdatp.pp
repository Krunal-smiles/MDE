# enable Windows Defender AV
windowsfeature { 'windows-defender' :
  ensure => 'present',
}

# check Windows Defender AV service is running
service { 'WinDefend' :
  ensure => 'running',
  enable => 'true',
}

# check Windows Defender Firewall service is running
service { 'mpssvc' :
  ensure => 'running',
  enable => 'true',
}

# check Windows Error reporting service is running
service { 'Wersvc' :
  ensure => 'running',
  enable => 'true',
}

# check windows update service is running
service { 'Wuauserv' :
  ensure => 'running',
  enable => 'true',
}

# todo: security intelligent update, auto exlusion, sample submission

# Telemetry settings
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' :
  ensure => present,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection\TelemetryProxyServer' :
  ensure => present,
  type   => string,
  data   => 'proxy:3128',
}


# Windows Defender Setting
registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' :
  ensure => present,
}

registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\ProxyServer' :
  ensure => present,
  type   => string,
  data   => 'proxy:3128',
}

# cloud delivered protection
registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' :
  ensure       => present,
  purge_values => true,
}

#registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine' :
#  ensure       => present,
#  purge_values => true,
#}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet\SpynetReporting' :
#  ensure => present,
#  type   => dword,
#  data   => 2,
#}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet\DisableBlockAtFirstSeen' :
#  ensure => present,
#  type   => dword,
#  data   => 0,
#}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet\LocalSettingOverrideSpynetReporting' :
 # ensure => present,
#  type   => dword,
 # data   => 0,
#}

registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet\SubmitSamplesConsent' :
  ensure => present,
  type   => dword,
  data   => 1,
}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine\MpBafsExtendedTimeout' :
#  ensure => present,
#  type   => dword,
#  data   => 0,
#}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine\MpCloudBlockLevel' :
#  ensure => present,
#  type   => dword,
#  data   => 0,
#}

# add exclusions here
#registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions' :
#  ensure => present,
#}

#registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths' :
#  ensure       => present,
#  purge_values => true,
#}

#registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths\\\C:\Temp' :
#  ensure => present,
#  type   => string,
#  data   => '0',
#}



# Windows Defender Security Center App 
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center' :
  ensure => present,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray' :
  ensure       => present,
  purge_values => true,
}
registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection' :
  ensure       => present,
  purge_values => true,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection\DisallowExploitProtectionOverride' :
  ensure => present,
  type   => dword,
  data   => 1,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security\DisableClearTpmButton' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security\HideSecureBoot' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security\DisableTpmFirmwareUpdateWarning' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security\HideTPMTroubleshooting' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\CompanyName' :
  ensure => present,
  type   => string,
  data   => 'AllSafe',
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\Email' :
  ensure => present,
  type   => string,
  data   => 'support@allsafe.net',
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\EnableInApp' :
  ensure => present,
  type   => dword,
  data   => 1,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\EnableForToasts' :
  ensure => present,
  type   => dword,
  data   => 1,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\Phone' :
  ensure => present,
  type   => string,
  data   => 'krunal.patel@allsafe.net',
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization\Url' :
  ensure => present,
  type   => string,
  data   => 'https://support.allsafe.net',
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications\DisableEnhancedNotifications' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications\DisableNotifications' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray\HideSystray' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection\HideRansomwareRecovery' :
  ensure => present,
  type   => dword,
  data   => 0,
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection\UILockdown' :
  ensure => present,
  type   => dword,
  data   => 0,
}
#exec { 'add-exclusion' :
#	command => 'Add-MpPreference -ExclusionPath "C:\Temp","D:\Temp"',
#	provider => powershell,
#}

#todo: add cloud connection, tamper protection as fact, 
