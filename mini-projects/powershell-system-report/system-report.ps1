$report = [ordered]@{
    ComputerName = $env:COMPUTERNAME
    UserName = $env:USERNAME
    WindowsVersion = (Get-CimInstance Win32_OperatingSystem).Caption
    TotalMemoryGB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    CurrentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

$report.GetEnumerator() | ForEach-Object {
    "{0}: {1}" -f $_.Key, $_.Value
} | Tee-Object -FilePath "system-report.txt"

Write-Host "Report saved to system-report.txt"
