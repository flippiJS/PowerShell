﻿<#
.SYNOPSIS
	Lists empty files within a directory tree
.DESCRIPTION
	This script scans and lists all empty files within the given directory tree.
.PARAMETER DirTree
	Specifies the path to the directory tree
.EXAMPLE
	PS> ./list-empty-files C:\
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$DirTree = "")

try {
	if ($DirTree -eq "" ) { $DirTree = read-host "Enter the path to the directory tree" }

	[int]$Count = 0
	write-progress "Listing empty files in $DirTree ..."
	get-childItem $DirTree -attributes !Directory -recurse | where {$_.Length -eq 0} | foreach-object {
		write-output $_.FullName
		$Count++
	}

	"✔️ found $Count empty file(s)" 
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
