﻿<#	    
    1. Create Powershell Profile
    2. Install Programs
    3. Create new PATH parameter
#>

#TODO: Create a variable with a tostring method to populate profile, replace ' with " so that you can change run the changes without having to reopen window.


#Create PowerShell Profile
{    
    $ItemPath = "C:\Users\$env:username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $ItemValue = '$Shell = $Host.UI.RawUI
        $WindowSize = $Shell.WindowSize
        $BufferSize = $Shell.BufferSize
        $WindowPosition = $Shell.WindowPosition

        $Shell.ForegroundColor = "Yellow"
        $Shell.BackgroundColor = "Black"
        $WindowPosition.X = "1234"
        $WindowPosition.Y = "50"
        $BufferSize.Height = "9999"
        $BufferSize.Width = "90"
        $WindowSize.Height = "30"
        $WindowSize.Width = "90"
        $Shell.WindowTitle = "Virtual Machine Console"

        $Host.PrivateData.ErrorForegroundColor = "cyan"

        Set-Location \'

    $PathVariables = @{Path = $ItemPath
        ItemType            = "File"
        Value               = $ItemValue
    }

    New-Item @PathVariables
}

#Install Programs
{

    #Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    #Install Chrome
    Choco install googlechrome -y

    #Install Firefox
    Choco install firefox -y

    #Install Sysinternals
    Choco install sysinternals -y

    #Install Visual Studio Code
    choco install visualstudiocode -y

    #Install Git
    choco install git -y
}

#Set Variables
{
    $Path = $env:Path
    $env:MyTestVariable = "_NT_SYMBOL_PATH"
    $Symbol = "srv*C:\symbols*http://msdl.microsoft.com/downloads/symbols"
    
    [Environment]::SetEnvironmentVariable("_NT_SYMBOL_PATH", "$Symbol", "Machine")
}