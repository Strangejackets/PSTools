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
function Get-LiveHosts
{

    Begin
    {$subnet = read-host "enter subnet to scan format '172.16.100.x'"
    }
    Process
    {for ($i=1; $i -le 255; $i++) {
    ping -n 1 -w 250 $subnet$i | select-string Packets:
    nslookup $subnet$i}
    }
    End
    {
    }
}