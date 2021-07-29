[cmdletBinding(PositionalBinding=$false)]
param(
[Parameter(Mandatory=$true)]
[String]$path,

[ValidateRange(1,3)]
[int]$anzOrdner = 1,

[ValidateRange(1,10)]
[int]$anzFiles = 1

)

Function neueFiles
{    
param(
[string[]]$Pfad,
[int]$anzFiles
)    

    for($WertFile=1;$WertFile -le $anzFiles;$WertFile++)    
    {        
        $newFile = "$Pfad\text.$wertFile.txt"
        New-Item -Path $newFile -Force    
    }
}

$path = "C:\$path"
New-Item -Path $path -ItemType Directory -Force

neueFiles -Pfad $path -anzFiles $anzFiles
cd $path
for($WertOrd=1;$WertOrd -le $anzOrdner;$WertOrd++)
{    
    $OrdPath = "Ordner$WertOrd"    
    New-Item -Path $OrdPath -ItemType Directory -Force    
    neueFiles $OrdPath -anzFiles $anzFiles   
    cd $path
}