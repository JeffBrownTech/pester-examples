function Get-Something {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ThingToGet = "something"
    )

    Write-Output "I got $ThingToGet!"
}
