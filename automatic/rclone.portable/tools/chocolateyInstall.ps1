$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.53.2/rclone-v1.53.2-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.53.2/rclone-v1.53.2-windows-amd64.zip'
    Checksum = '3f8037d06b0067ffe389d35e2f0d510533215c1c4ddb0c54d5f48edba09fa8e8'
    ChecksumType = "sha256"
    Checksum64 = '3f6c1661c3369708619b22062c1aa6532d6e5a9b08a4335c94c6fb827a836542'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
