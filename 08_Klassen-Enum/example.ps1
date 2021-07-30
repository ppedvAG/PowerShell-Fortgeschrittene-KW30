class Auto
{
     [int]$Türen
     static [int]$numberOfWheels = 4
     [string]$Marke

     [AutoFarben]$Farbe
}

Enum AutoFarben
{
    Blau
    Schwarz
    Grün
    Rot
}

$car = New-Object Auto
$car.Türen = 2
$car.Marke = "Lada"
$car.Farbe = [AutoFarben]::Grün

