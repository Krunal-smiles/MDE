$workspaceid = '230335f0-2392-4823-9e4a-f47b9482e990'
$workspacekey = 'udWazjInW1mMK9Qchwj5Xoq0MZXS+cdvL1DNjqkJvsfZlUX1k/Vnzu7X9Ogr35N8A87DGqCQqGN9MzWS8Gta7w=='

exec { 'install-mma' :
	command => 'C:\Temp\install-mma.ps1 -installerpath C:\Temp\MMASetup-AMD64.exe -tempdir C:\Temp',
	provider => powershell,
}

exec { 'add-atp-workspace' :
	command => "C:\Temp\add-atp-workspace.ps1 -workspaceid ${workspaceid} -workspacekey ${workspacekey}",
	provider => powershell,
}

#exec { 'remove-atp-workspace' :
#	command => 'C:\Temp\',
#	provider => powershell,
#}

#exec { 'add-exclusion' :
#	command => 'Add-MpPreference -ExclusionPath "C:\Temp","D:\Temp"',
#	provider => powershell,
#}
