$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.5/rclone-v1.49.5-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.5/rclone-v1.49.5-windows-amd64.zip'
    Checksum = '9f0620e3aa3a76d2f94e656bf8239490ba62ee218b841b45fdcf4f9b9a53380f'
    ChecksumType = "sha256"
    Checksum64 = '2ac452fcdde0d9a0513c34fd79f441d8104d266715e6a0bd516b5efef53f325d'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
