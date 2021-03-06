$Folders = "\\$env:COMPUTERNAME\c$\Users\$env:USERNAME\Desktop", "\\$env:COMPUTERNAME\c$\Users\$env:USERNAME\Documents", "\\$env:COMPUTERNAME\c$\Users\$env:USERNAME\Downloads", "\\$env:COMPUTERNAME\c$\Users\$env:USERNAME\Favorites", "\\$env:COMPUTERNAME\c$\Users\$env:USERNAME\Pictures"

foreach ($Source in $Folders) {  
    
    $Array = $Source -split '\\'
    $Parent = $Array[6]
    $Destination = "\\labdc01\SHARED\Personal Files Backup\$env:USERNAME\$Parent"
    $PathBool = Test-Path -Path "$Destination"
    
    if (!$PathBool) {

        New-Item -Path "$Destination" -ItemType 'Directory' -Force | Out-Null
        
    } 
    robocopy "$Source" "$Destination" /e
}