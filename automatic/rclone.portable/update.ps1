import-module au

$github_releases = 'https://api.github.com/repos/ncw/rclone/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*Url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*Url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*Checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
            "(?i)(x32-ver: Get-RemoteChecksum).*" = "`${1} $($Latest.URL32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
            "(?i)(x64-ver: Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
        }
    }
}

function global:au_BeforeUpdate {
}

function global:au_GetLatest {
    $releases = Invoke-RestMethod $github_releases -Headers @{Authorization="token ${Env:github_api_key}"}
    
    $386 = $releases[0].assets | Where-Object { $_.name -ilike "*windows-386*" }
    $amd64 = $releases[0].assets | Where-Object { $_.name -ilike "*windows-amd64*" }
    $url32   = $386.browser_download_url
    $url64   = $amd64.browser_download_url

    $version  = $releases[0].tag_name -replace 'v',''

    $checksumsUrl = ($releases[0].assets | Where-Object { $_.name -ilike "sha256sums" }).browser_download_url
    $checksums = (Invoke-WebRequest $checksumsUrl).RawContent
    $checksum32 = if ($checksums -match "(.*)  rclone.*windows-386.*") {   $Matches[1] }
    $checksum64 = if ($checksums -match "(.*)  rclone.*windows-amd64.*") {   $Matches[1] }

    @{
        Version      = $version
        URL32        = $url32
        URL64        = $url64
        ReleaseNotes = $releases[0].Body
        Checksum32 = $checksum32
        Checksum32Type = 'sha256'
        Checksum64 = $checksum64
        Checksum64Type = 'sha256'

    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
