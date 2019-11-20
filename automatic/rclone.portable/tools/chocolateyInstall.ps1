$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.50.2/rclone-v1.50.2-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.50.2/rclone-v1.50.2-windows-amd64.zip'
    Checksum = '98cf924fad87208fec80e6d57f265c18c768763443aacc49726a285721f62be9'
    ChecksumType = "sha256"
    Checksum64 = '1e3191f69886ce0e003ec93d96e5db46a76086699cb20cf0d634d518ad157627'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
