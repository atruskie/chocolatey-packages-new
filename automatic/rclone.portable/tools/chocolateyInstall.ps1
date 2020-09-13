$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.53.1/rclone-v1.53.1-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.53.1/rclone-v1.53.1-windows-amd64.zip'
    Checksum = '65e01d7d0bf71eb8eef6aad8e91d3ba873a9f1c315858586b8277945bbf9d394'
    ChecksumType = "sha256"
    Checksum64 = 'a6ea94f301705dfafc286948d444121a78c466da21c67880a7f390ea9ea749c4'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
