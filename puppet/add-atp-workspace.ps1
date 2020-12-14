[CmdletBinding()]
param([Parameter(Mandatory=$True,Position=1)][string]$workspaceid,
      [Parameter(Mandatory=$True,Position=2)][string]$workspacekey
)

$mma = New-Object -ComObject 'AgentConfigManager.MgmtSvcCfg'
try {
	$mma.AddCloudWorkspace($workspaceid, $workspacekey)
	$mma.ReloadConfiguration()
	exit 0
} catch {
	exit 1
}
