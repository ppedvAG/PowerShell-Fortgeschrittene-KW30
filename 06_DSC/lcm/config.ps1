
Configuration dynamicServerConfig
{
    
    Node $AllNodes.NodeName
    {
        LocalConfigurationManager
        {
            ConfigurationMode = "ApplyAndAutoCorrect"
            ConfigurationModeFrequencyMins = 15
        
        }
        foreach($Feature in $Node.WindowsFeatures)
        {
            WindowsFeature $Feature.Name
            {
                NAme = $Feature.Name
                Ensure = $Feature.Ensure
            }
        }
    }
}

dynamicServerConfig -OutputPath C:\KursExamples\06_DSC\lcm\ -ConfigurationData C:\KursExamples\06_DSC\dynamisch\dsc-web.psd1

Start-DscConfiguration -wait -verbose -Path C:\KursExamples\06_DSC\dynamisch