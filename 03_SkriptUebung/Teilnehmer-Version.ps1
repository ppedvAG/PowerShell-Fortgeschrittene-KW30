
[cmdletBinding()] 
Param(

[Parameter(Mandatory=$true)] 
[string]$Path = "c:\Uebung\",

[ValidateRange(1,10)]  
[int]$AnzahlOrdner = 3,

[ValidateRange(1,10)]  
[int]$AnzahlDateien = 2,


[bool]$AusgabeMessage = 1

)

if ($AusgabeMessage -eq 1)
{
    Write-Verbose -Message "Es werden $AnzahlOrdner mit jeweils $AnzahlDateien erstellt."
}



for ($i = 1; $i -le $AnzahlOrdner; $i++)
{
    $n = "TestFiles" + $i 
    #$f = $n + "txt"
    
    New-Item -Path $Path -Name $n -ItemType "Directory" 

    $PathFolder = $Path+"\"+$n

        for ($j = 1; $j -le $AnzahlDateien; $j++)
        {
           # $Path += "\"+$n
            $f = "File"+$j + ".txt"
         #   write-host $PathFolder
            New-Item -Path $PathFolder -Name $f -ItemType "file"

             $zufallszahl = Get-Random -Maximum 987654321 # zufällige Zahl erstellen            
            Add-Content -path "$($PathFolder)\$f" -Value $zufallszahl 

        }
   # $destPath = $Path + "Test"
   # Compress-Archive -Path $Path -DestinationPath $destPath
}


#New-Item -Path $Path -Name TestFiles -ItemType "Directory" 

