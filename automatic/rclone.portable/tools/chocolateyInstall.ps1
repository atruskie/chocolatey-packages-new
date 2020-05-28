$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.52.0/rclone-v1.52.0-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.52.0/rclone-v1.52.0-windows-amd64.zip'
    Checksum = '64ff1bc0a4b00367b18dbe95b4032bb1fab32806324bf00775ea583d4837572f'
    ChecksumType = "sha256"
    Checksum64 = 'aefbfd6cd31ed8dbce41899f4f2b488b904c1512f98744c83c22960f9411d1c1'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
