param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $GameExe
)

Set-ExecutionPolicy Bypass -Scope Process
powershell -File D:\prototype-fixes\DisableHid.ps1
$pinfo = New-Object System.Diagnostics.ProcessStartInfo
$pinfo.FileName = $GameExe
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start()
$cpuCoresCount = [System.Environment]::ProcessorCount
if($cpuCoresCount -eq 12) {
   $p.ProcessorAffinity=0x555
}
elseif ($cpuCoresCount -gt 8) {
    $p.ProcessorAffinity=0x5555
}
$p.WaitForExit()
powershell -File D:\prototype-fixes\EnableHid.ps1