#!/usr/bin/env pwsh

# Copyright (C) 2018 Tatsunori Uchino
# This script is licensed under The MIT License.
# https://opensource.org/licenses/MIT

$ErrorActionPreference = "Stop"
if (!(Get-Command luajittex)) {
    throw New-Object System.IO.FileNotFoundException -ArgumentList "luajitlatex is not found in the PATH.", "luajitlatex.exe"
}
if (!(Get-Command kpsewhich)) {
    throw New-Object System.IO.FileNotFoundException -ArgumentList "kpsewhich is not found in the PATH.", "kpsewhich.exe"
}
$fmtutil_cnf = kpsewhich fmtutil.cnf
if ($fmtutil_cnf -eq $null) {
    throw New-Object System.IO.FileNotFoundException -ArgumentList "fmtutil.cnf not found.", "fmtutil.cnf"
}
$original = Get-Content $fmtutil_cnf -Encoding UTF8 

if ($original | Where-Object { $_ -match "^#! .*luajitlatex" }) {
    # "#! luajitlatex" -> "luajitlatex"
    $modified = $original | ForEach-Object {
        if ($_.Contains("luajitlatex")) {
            $_ -replace "^#! ", "" # Remove leading "#!"
        }
        else {
            $_ # Don't replace
        }
    }
    
    # Write content in UTF-8 w/o BOM
    $utf8_no_bom = New-Object System.Text.UTF8Encoding($False)
    [System.IO.File]::WriteAllLines($fmtutil_cnf, $modified, $utf8_no_bom)
    
    fmtutil-sys --byfmt luajitlatex
    if ($?) { 
        Write-Output "Succeeded to enable LuaJITLaTeX."
        Write-Output "To use it, execute \`luajitlatex' insted of \`lualatex'."
    }
    else {
        Write-Error "Failed to enable LuaJITLaTeX by fmtutil-sys."
        exit 1
    }
}
else {
    Write-Output "LuaJITLaTeX has already been enabled."
}