$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/ncw/rclone/releases/download/v1.48.0/rclone-v1.48.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/ncw/rclone/releases/download/v1.48.0/rclone-v1.48.0-windows-amd64.zip'
    Checksum = '53b6c790687620aec8c28318c78d8471bcab2346d07bf30dc09e937000419547'
    ChecksumType = "sha256"
    Checksum64 = 'c75f3a339eecbdca25578a8a38dc3412d894bfad6e69ad1bd5be3c1ab98ae542'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
