configuration SimpleWebServer
{
    # Zum Abrufen der Knotenliste können Ausdrücke ausgewertet werden.
    # Beispiel: $AllNodes.Where("Role -eq Web").NodeName
    node ("Member1")
    {
        # Ressourcenanbieter aufrufen
        # Beispiel: WindowsFeature, File
        WindowsFeature WebServerRole
        {
           Ensure = "Present"
           Name   = "Web-Server"
        }

        WindowsFeature WebMgmtTool
        {
            Ensure = "Present"
            Name = "Web-Mgmt-Tools"
        }     
    }
}

SimpleWebServer -OutputPath "C:\KursExamples\06_DSC\simple"

Start-DscConfiguration -Wait -Verbose -Path C:\KursExamples\06_DSC\simple