$ErrorActionPreference = 'Stop'
$latexCommand = Get-Command xelatex -ErrorAction Stop
$buildDirectory = Join-Path $PSScriptRoot 'tmp\latex'
$outputDirectory = Join-Path $PSScriptRoot 'output\pdf'

New-Item -ItemType Directory -Path $buildDirectory, $outputDirectory -Force | Out-Null
Push-Location $PSScriptRoot
try {
    foreach ($pass in 1..2) {
        & $latexCommand.Source '-interaction=nonstopmode' '-halt-on-error' '-no-shell-escape' "-output-directory=$buildDirectory" 'main.tex'
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX failed on pass $pass. See tmp\latex\main.log."
        }
    }
    Copy-Item -LiteralPath (Join-Path $buildDirectory 'main.pdf') -Destination (Join-Path $outputDirectory 'main.pdf') -Force
    Write-Output "PDF: $(Join-Path $outputDirectory 'main.pdf')"
}
finally {
    Pop-Location
}
