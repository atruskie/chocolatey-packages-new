$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.0/rclone-v1.49.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.0/rclone-v1.49.0-windows-amd64.zip'
    Checksum = 'c869e909f1a9dd0b7e33268e55f025fac501dca0f36616fb082824989125a69d'
    ChecksumType = "sha256"
    Checksum64 = '790b86f01eb3ca725cb50de2d1a92ea4a3a4d63952401e7fea6652569ab5cb3e'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
