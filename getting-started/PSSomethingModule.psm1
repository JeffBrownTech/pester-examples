function Get-Something {    
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ThingToGet
    )

    if ($PSBoundParameters.ContainsKey('ThingToGet')) {
        Write-Output "I got $ThingToGet!"
    }
    else {
        Write-Output "I got something!"
    }
}
