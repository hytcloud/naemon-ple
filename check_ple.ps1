<#
.SYNOPSIS
Check PLE

.DESCRIPTION
This is a simple PowerShell script to Check PLE

.PARAMETER username
SQL username

.PARAMETER password
SQL password

.NOTES
version : 2026/09/09

.LINK
https://github.com/hytcloud/naemon-ple.git
#>

param (
	[Parameter(Mandatory = $true, Position = 0)]
	[string]$username,
	[Parameter(Mandatory = $true, Position = 1)]
	[string]$password
)

$ple = Invoke-Sqlcmd -Username $username -Password $password -Query "SELECT cntr_value FROM sys.dm_os_performance_counters WHERE [object_name] LIKE '%Buffer Manager%' AND [counter_name] = 'Page Life Expectancy'" | Select-Object -ExpandProperty cntr_value

if ($ple -lt 300) {
	Write-Output "CRITICAL - PLE is $ple seconds | ple=$ple;;;;"
	exit 2
}
elseif ($ple -lt 1000) {
	Write-Output "WARNING - PLE is $ple seconds | ple=$ple;;;;"
	exit 1
}
else {
	Write-Output "OK - PLE is $ple seconds | ple=$ple;;;;"
	exit 0
}