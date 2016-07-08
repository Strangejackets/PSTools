function remove-applixmass {
   [CmdletBinding()]
    Param
        (
        # Provide the path to the text file
        [Parameter(Mandatory=$true)]
        [string]$Path

    )
$pclist = get-content $path
foreach ($pc in $pclist) {
remove-applixure $pc -verbose
}
}
