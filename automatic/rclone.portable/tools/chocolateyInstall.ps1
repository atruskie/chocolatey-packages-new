$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    Destination    = $toolsDir
    FileFullPath   = Join-Path $toolsDir 'rclone-v1.63.1-windows-386.zip'
    FileFullPath64 = Join-Path $toolsDir 'rclone-v1.63.1-windows-amd64.zip'
}

#Remove old versions of rclone in the tools directory
Get-ChildItem -Path $toolsDir | Where-Object { $_.PSIsContainer } | Remove-Item -Recurse -Ea 0

Get-ChocolateyUnzip @packageArgs

Write-Host "$packageName installed to $toolsDir"

Remove-Item -Force -Path $toolsDir\*.zip
