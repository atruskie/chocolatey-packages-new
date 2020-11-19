import-module au

$github_releases = 'https://api.github.com/repos/ncw/rclone/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
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
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $releases = Invoke-RestMethod $github_releases -Headers @{Authorization="token ${Env:github_api_key}"}
    
    $386 = $releases[0].assets | Where-Object { $_.name -ilike "*windows-386*" }
    $amd64 = $releases[0].assets | Where-Object { $_.name -ilike "*windows-amd64*" }
    $url32   = $386.browser_download_url
    $url64   = $amd64.browser_download_url

    $version  = $releases[0].tag_name -replace 'v',''

    @{
        Version      = $version
        URL32        = $url32
        URL64        = $url64
        ReleaseNotes = $releases[0].Body

    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
