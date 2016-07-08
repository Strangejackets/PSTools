<#
.Synopsis
   This uninstalls Applixure 
.DESCRIPTION
   Change "name = 'Applixure Agent'" with a name from gwmi -class win32_product to uninstall something else 
.EXAMPLE
   remove-applixure -computername pc150302
#>
function remove-applixure
{
    [CmdletBinding()]
    Param
    (
        # Enter the Computername
        [Parameter(Mandatory=$true)]
        $computername

    )

    Begin
    {$s = New-PSSession $Computername
    write-verbose "Connecting to $computername" 
    }
    Process
    {write-verbose "Starting uninstall on $computername"
    Invoke-Command -Session $s -ScriptBlock{(gwmi -Class win32_product -Filter "Name = 'Applixure Agent'").uninstall()
    }
    }
    End
    {write-verbose "Closing session with $computername"
    Remove-PSSession $s
    }
}