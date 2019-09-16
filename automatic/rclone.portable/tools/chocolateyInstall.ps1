$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.3/rclone-v1.49.3-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.3/rclone-v1.49.3-windows-amd64.zip'
    Checksum = '3d2340a92aa4204e80ac0d4ea1a3be78ef4c71ccdce6f09f914df0660a4345b7'
    ChecksumType = "sha256"
    Checksum64 = '910614369f3d7222981ee9d66cb568e13cf0a0d671004c7283057809a68a1ccf'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
