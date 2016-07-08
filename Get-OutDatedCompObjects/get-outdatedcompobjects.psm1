function Get-OutDatedCompObjects {
Remove-Item C:\temp\outdatedcompobjects.txt
$test = Get-ADComputer -Filter {OperatingSystem -like "*Windows*"} -Properties PasswordLastSet -SearchBase "DC=contoso,DC=com" | select name, PasswordLastSet | sort -Property PasswordLastSet
$date = get-date
$year = $date.AddYears(-1)
foreach ($t in $test) {
    if (($t.PasswordLastSet) -lt ($year)) {
        echo $t.name | Out-File c:\temp\outdatedcompobjects.txt -Append
        }
        }
$content = get-content C:\temp\outdatedcompobjects.txt | Out-String 
Send-MailMessage -From powershell@contoso.com -To powershell@contoso.com -Subject "Outdated Comp Objects" -body $content -SmtpServer mailserver.contoso.com
}
