. $PSScriptRoot\..\rclone.portable\update.ps1

function global:au_SearchReplace {
   @{
        "rclone.nuspec" = @{
            "(\<dependency .+?`"rclone.portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

update -ChecksumFor none