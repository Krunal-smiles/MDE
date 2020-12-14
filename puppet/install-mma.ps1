[CmdletBinding()]
param([Parameter(Mandatory=$True,Position=1)][string]$installerpath,
      [Parameter(Mandatory=$True,Position=2)][string]$tempdir
)

try {
    $prs = Start-Process -FilePath $installerpath -Wait -NoNewWindow -WorkingDirectory $tempdir -ArgumentList '/C:"Setup.exe /qn NOAPM=1 AcceptEndUserLicenseAgreement=1"'
    $prs.HasExited
	return $prs.ExitCode
} catch {
	exit 1
}
