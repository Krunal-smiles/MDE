windowsfeature { 'windows-defender' :
	ensure => 'present',
}

service { 'WinDefend' :
	ensure => 'running',
	enable => 'true',
}

service { 'mpssvc' :
	ensure => 'running',
	enable => 'true',
}

service { 'Wersvc' :
	ensure => 'running',
	enable => 'true',
}

service { 'Wuauserv' :
	ensure => 'running',
	enable => 'true',
}

registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' :
	ensure => present,
}

registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions' :
	ensure => present,
}

registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths' :
	ensure => present,
	purge_values => true,
}

registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths\\\C:\Temp' :
	ensure => present,
	type => string,
	data => "0",
}

#exec { 'add-exclusion' :
#	command => 'Add-MpPreference -ExclusionPath "C:\Temp","D:\Temp"',
#	provider => powershell,
#}
