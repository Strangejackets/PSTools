<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-LiveHosts -net
  Param
    (
        # Enter network as xx.xx.xx.
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $net 
        )
{
foreach ($i in 1..255) {
test-connection -computername $net.$i -count 1 -erroraction silentlycontinue
}
}
