$ErrorActionPreference = 'Stop'
try {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $baseDir = Split-Path -Parent $scriptDir
    $biediPath = Join-Path $baseDir 'CRP_Server\mission.biedi'
    $templatePath = Join-Path $baseDir 'CRP_Server\mission.template'
    
    if (-not (Test-Path $biediPath)) {
        Write-Error "File not found: $biediPath"
        exit 1
    }
    
    $lines = Get-Content $biediPath -ErrorAction Stop
    $vehicles = @()
    $inVehicle = $false
    $inArguments = $false
    $name = ''
    $type = ''
    $position = ''
    $azimut = '0'

    foreach ($line in $lines) {
        $line = $line.TrimEnd()
        if ($line -match 'objectType="vehicle"') {
            $inVehicle = $true
            $name = ''
            $type = ''
            $position = ''
            $azimut = '0'
        }
        if ($inVehicle -and $line -match 'class Arguments') {
            $inArguments = $true
        }
        if ($inArguments) {
            if ($line -match 'NAME="([^"]+)"') { $name = $Matches[1] }
            if ($line -match 'TYPE="([^"]+)"') { $type = $Matches[1] }
            if ($line -match 'POSITION="([^"]+)"') { $position = $Matches[1] }
            if ($line -match 'AZIMUT="([^"]+)"') { $azimut = $Matches[1] }
            if ($line -match '^\s*\}\s*;?\s*$') {
                $inArguments = $false
                if ($inVehicle -and $type -and $position) {
                    $vehicles += "[""$name"", ""$type"", $position, $azimut]"
                }
                $inVehicle = $false
            }
        }
    }

    if ($vehicles.Count -gt 0) {
        $output = '['
        for ($i = 0; $i -lt $vehicles.Count; $i++) {
            $output += $vehicles[$i]
            if ($i -lt $vehicles.Count - 1) { $output += ",`n" }
        }
        $output += "`n]"
    } else {
        $output = "[`n]"
    }

    Set-Content -Path $templatePath -Value $output -Encoding UTF8
    Write-Host "Successfully updated $templatePath with $($vehicles.Count) vehicles"
} catch {
    Write-Error "Error: $_"
    exit 1
}

