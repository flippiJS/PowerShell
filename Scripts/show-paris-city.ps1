﻿<#
.SYNOPSIS
	Shows Paris city in Google Maps 
.DESCRIPTION
	This script launches the Web browser with Google Maps at Paris city (France).
.EXAMPLE
	PS> ./show-paris-city
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://www.google.com/maps/place/Paris"
exit 0 # success
