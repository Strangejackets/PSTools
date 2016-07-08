<#
.Synopsis
   Get the Firewallstatus of the specified computer
.DESCRIPTION
   uses netsh advfirewall show domain to show the firewall of the specified computer
.EXAMPLE
   get-firewallstatus -computername dcprime01
#>
function Get-FirewallStatus
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Enter computername
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $computername
    )

    Begin
    {
    $s = new-pssession -ComputerName $computername
    }
    Process
    {invoke-command -Session $s -ScriptBlock {netsh advfirewall show domain}
    }
    End
    {Remove-PSSession $s
    }
}