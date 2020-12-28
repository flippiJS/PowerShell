#!/snap/bin/powershell

# Syntax:	./list-random-passwords.ps1
# Description:	prints a list of random passwords
# Author:	Markus Fleschutz
# Source:	github.com/fleschutz/PowerShell
# License:	CC0
 
$PasswordLength = 15
$Columns = 6
$Lines = 24
$MinCharCode = 33
$MaxCharCode = 126

function GeneratePassword() {
	$Generator = New-Object System.Random
	for ($i = 0; $i -lt $PasswordLength; $i++) {
		$Result += [char]$Generator.next($MinCharCode,$MaxCharCode)
	}
	return $Result
}

try {
	write-output ""
	for ($j = 0; $j -lt $Lines; $j++) {
		$Line = ""
		for ($k = 0; $k -lt $Columns; $k++) {
			$Line += GeneratePassword
			$Line += "   "
		}
		write-output $Line
	}
	write-output ""
	exit 0
} catch {
	write-error "ERROR in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}