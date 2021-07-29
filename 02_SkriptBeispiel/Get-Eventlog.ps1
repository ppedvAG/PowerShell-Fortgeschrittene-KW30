[cmdletBinding(PositionalBinding=$false)] 
param(

[Parameter(Position=0)]
[string]$ComputerName = "localhost",

[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5
)

<#
PositionalBinding = $false | deaktiviert die Standard Nummierung der Parameter. Sodass dieses Skript nur über sogenannte benannte Parameter aufgerufen werden kann

Dokumentation zu cmdletBinding:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute?view=powershell-5.1
---------------------
Position = 0 | weißt einem Parameter die Position 0 zu sodass dieser als Positionaler Parameter verwendet werden kann.
Mandatory = $true | Sorgt dafür das der Parameter zu einem Pflicht Parameter wird

Dokumentation zu Advanced Parametern
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-5.1#attributes-of-parameters

#>

Get-eventlog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

