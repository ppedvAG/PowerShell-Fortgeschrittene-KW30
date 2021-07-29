param(
$ComputerName,
$EventId,
$Newest
)

Get-eventlog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

