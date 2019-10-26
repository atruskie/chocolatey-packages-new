$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.50.0/rclone-v1.50.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.50.0/rclone-v1.50.0-windows-amd64.zip'
    Checksum = '0b812749ce555f364c0993e7a8f34d09763d147aecea449e53139027b3e804a9'
    ChecksumType = "sha256"
    Checksum64 = '2a5a47604d50aaba73beca2cc472b14f8139957af40533e323f20d33a0c228b5'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
