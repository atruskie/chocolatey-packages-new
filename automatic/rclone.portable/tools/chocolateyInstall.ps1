$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.1/rclone-v1.49.1-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.1/rclone-v1.49.1-windows-amd64.zip'
    Checksum = 'fe9c23b1a657a23664dc945846489c4cb410c330f6f577000675ff6d439fe317'
    ChecksumType = "sha256"
    Checksum64 = '4e9e83fefd3616c325a48e395fbd22eb3524282fa29c79d4b74796783ddb4e44'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
