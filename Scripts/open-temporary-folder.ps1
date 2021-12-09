﻿<#
.SYNOPSIS
	Opens the temporary folder
.DESCRIPTION
	This script launches the File Explorer showing the temporary folder.
.EXAMPLE
	PS> ./open-temporary-folder
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	$TargetDir = resolve-path "$env:TEMP"
	if (-not(test-path "$TargetDir" -pathType container)) {
		throw "Temporary folder at 📂$TargetDir doesn't exist (yet)"
	}
	& "$PSScriptRoot/open-file-explorer.ps1" "$TargetDir"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}