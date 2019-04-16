$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/ncw/rclone/releases/download/v1.47.0/rclone-v1.47.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/ncw/rclone/releases/download/v1.47.0/rclone-v1.47.0-windows-amd64.zip'
    Checksum = '0cf904ce984fcd353cb137fae51d6c8ed14ff70e2c4c597717619cb213dab042'
    ChecksumType = "sha256"
    Checksum64 = '70a5325eba25fd10598ed69d0bd980e2e5c5538e1eb589c96aa772dee4393bb0'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
