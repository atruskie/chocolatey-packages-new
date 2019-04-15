
$ErrorActionPreference = 'Stop'

Get-ChocolateyUnzip @packageArgs

Write-Host "$packageName installed to $toolsPath"