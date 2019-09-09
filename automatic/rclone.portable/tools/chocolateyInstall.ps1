﻿$ErrorActionPreference = 'Stop'

$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = 'rclone.portable'
    Url = 'https://github.com/rclone/rclone/releases/download/v1.49.2/rclone-v1.49.2-windows-386.zip'
    UnzipLocation = $toolsDir
    Url64bit = 'https://github.com/rclone/rclone/releases/download/v1.49.2/rclone-v1.49.2-windows-amd64.zip'
    Checksum = 'c79036cc14b53ac14867a742f6b800cf551d45c236ef2619778bd59fb06964d8'
    ChecksumType = "sha256"
    Checksum64 = '5bffabbe69098d1cc783e279171734461840effeddc03d6d316c965bbdb0a578'
    Checksum64Type = "sha256"
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsPath"
