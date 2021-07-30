$session = New-PSSession -ComputerName Member1

try
{
    Invoke-Command -Session $session -ScriptBlock {"Mach was"} -ErrorAction Stop #ErrorAction Stop ist wichtig, da nur bei Terminierenden Fehlern in den Catch Block gesprungen wird
}
catch
{
    Write-Host -ForegroundColor Red -Object "That shouldnt happen"
}
finally
{
    Remove-PSSession -Session $session
}
#############################################

try
{
    $pfadtest = Test-Path -Path Y:\Fantasiepfad -ErrorAction Stop
    if($pfadtest -ne $true)
    {
        #nicht Terminierender Fehler im Default, somit wird nicht in den Catch Block gesprungen
        #mit Error Action Stop kann aber ein Terminierender Fehler "simuliert" werden sodass trotzdem der catch block ausgelöst wird
        #Write-Error -Message "Ein Fehler ist aufgetreten" -ErrorAction Stop

        #Erzeugen eines terminierenden Fehler
        throw "Böse Böse Böse Dinge sind geschehen"
    }
}
catch
{
    Write-Host -Object "Fehler" 
}

