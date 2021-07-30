@{
    AllNodes = @(
    @{
        NodeName = "Member1"
        WindowsFeatures = @(
            @{
                Name="Web-Server"
                Ensure = "Present"
            },
            @{
                Name="web-mgmt-tools"
                Ensure = "Present"
            }
        )
    }
    )
}