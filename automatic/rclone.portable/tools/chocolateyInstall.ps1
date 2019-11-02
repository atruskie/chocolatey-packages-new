$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.50.1/rclone-v1.50.1-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.50.1/rclone-v1.50.1-windows-amd64.zip'
    Checksum = '959b7795c5c2ab20a8b6ca966d27566b44d454e1560a1395a6227673595ae4c3'
    ChecksumType = "sha256"
    Checksum64 = 'dc991348129a35580226bd7094a1d69999fce8219caaf2cfd4e9e341abcdc0ed'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
