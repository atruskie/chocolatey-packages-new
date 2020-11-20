$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    Destination    = $toolsDir
    FileFullPath   = Join-Path $toolsDir 'rclone-v1.53.3-windows-386.zip'
    FileFullPath64 = Join-Path $toolsDir 'rclone-v1.53.3-windows-amd64.zip'
}

#Remove old versions of rclone in the tools directory
Get-ChildItem -Directory -Path $toolsDir | Remove-Item -Recurse -Ea 0

Get-ChocolateyUnzip @packageArgs

Write-Host "$packageName installed to $toolsDir"

Remove-Item -Force -Path $toolsDir\*.zip