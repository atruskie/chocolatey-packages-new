$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.51.0/rclone-v1.51.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.51.0/rclone-v1.51.0-windows-amd64.zip'
    Checksum = 'e3c90a7bba30c2a8736f83f92aec16786d8de24df218270eab835f7b958ac13b'
    ChecksumType = "sha256"
    Checksum64 = 'fb60b26205c5f7f0469eeaca445747c8734b664f120a17bc2c17ecc5d4a25940'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
