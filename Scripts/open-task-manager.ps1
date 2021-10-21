﻿<#
.SYNOPSIS
	Starts the Task Manager
.DESCRIPTION
	This script starts the Task Manager application (Windows only).
.EXAMPLE
	PS> ./open-task-manager
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	start-process taskmgr.exe
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
