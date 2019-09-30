$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.4/rclone-v1.49.4-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.4/rclone-v1.49.4-windows-amd64.zip'
    Checksum = '705ae8b0825e331f498faac623279f281690a2721067a990f7b560ec0546089c'
    ChecksumType = "sha256"
    Checksum64 = '76db3a00e50d92303b3340ca592651b1ef4545b5a1cd1b9b5249c7debb0eb119'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
