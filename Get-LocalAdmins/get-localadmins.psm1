<#
.Synopsis
   get localadmins of specified pc 
.DESCRIPTION
  Specify computername to get local admins of computers.
  Does a transcript of what happened to c:\temp\logging.txt
  Lists localadmins in c:\temp\localadmins.txt
.EXAMPLE
   get-localadmins -computername pc150302
.EXAMPLE
$pcs = get-content C:\temp\pcsexperiment.txt
foreach ($pc in $pcs) {
get-localadmins -computername $pc
}

#>
function get-localadmins
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Computername
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $computername
    )

    Begin
    {Start-Transcript -Path C:\temp\logging.txt -Append
    $s = New-PSSession $Computername
    write-verbose "Connecting to $computername" 
    
        }
    Process
    {
    echo $computername | out-file c:\temp\localadmins.txt -Append
    Invoke-Command -Session $s -ScriptBlock{net localgroup administrators} | out-file c:\temp\localadmins.txt -Append
    }
    End
    {
    Remove-PSSession $s
    Stop-Transcript
    }
}

