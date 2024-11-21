# Check if the script is being run as Administrator
$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object System.Security.Principal.WindowsPrincipal($identity)

if (-not $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script must be run as Administrator."
    exit
}

# Auto-detect CPU Type (Intel or AMD)
$cpuInfo = Get-WmiObject Win32_Processor
$cpuManufacturer = $cpuInfo.Manufacturer
Write-Host "Detected CPU Manufacturer: $cpuManufacturer"

if ($cpuManufacturer -like "*Intel*") {
    Write-Host "Intel CPU detected, disabling Turbo Boost using Power Plan."

    # Disable Turbo Boost by setting Processor Performance Boost Mode to 'Disabled'
    powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 0
    powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 0

    # Apply changes to the active power plan
    powercfg -setactive SCHEME_CURRENT

    Write-Host "Turbo Boost has been disabled for Intel CPU."

} elseif ($cpuManufacturer -like "*AMD*") {
    Write-Host "AMD CPU detected. Disabling Precision Boost (Turbo Boost) might require BIOS adjustments or Ryzen Master."

    # Notify the user that Turbo Boost for AMD might require BIOS modification
    Write-Host "AMD CPUs require disabling Precision Boost in BIOS or using Ryzen Master (Windows)."
} else {
    Write-Host "Unknown CPU Manufacturer. Turbo Boost disabling might not be supported."
}
