[cmdletBinding(PositionalBinding=$false)]
param(
    [ValidateLength(1,100)]
    [Parameter(Mandatory=$true)]
    [string]$text
)

do
{
    $audioservice = Get-Service -Name Audiosrv

    if($audioservice.Status -ne "Running")
    {
        $audioservice.Start()
        Start-Sleep -Milliseconds 15
    }
    Start-Sleep -Milliseconds 20
}until((Get-Service -Name Audiosrv).Status -eq "Running")

#Mit Add-type kann jede beliebige .Net basierte Assembly oder DLL in den PowerShell Speicher für die Session / Scope geladen und verwendet werden
Add-Type -AssemblyName System.Speech
            
          #Mit New Object wird dann eine neue Instanz der Klasse erzeugt
$speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer

$speaker.Rate = -3

$voices = $speaker.GetInstalledVoices().VoiceInfo
$speaker.SelectVoice($voices[1].Name)

$speaker.Speak($text)