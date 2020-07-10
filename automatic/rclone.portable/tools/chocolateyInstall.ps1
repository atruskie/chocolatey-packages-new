$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.52.2/rclone-v1.52.2-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.52.2/rclone-v1.52.2-windows-amd64.zip'
    Checksum = 'da26b393f2c3615c3c124145f1643ec422743cb420b52b2332dd7826bf7fbf41'
    ChecksumType = "sha256"
    Checksum64 = '5f7271927d7abb552c96a53b9455d4634d04e5c1c94d154ca0ccb37f94ea3234'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
