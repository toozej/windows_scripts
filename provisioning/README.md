# Windows Boxstarter Scripts

Based heavily off Jess Frazelle's script here: https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
and Nick Craver's script here: https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9

This set of scripts uses [Boxstarter](https://boxstarter.org/) and [Chocolatey](https://chocolatey.org/) to setup a fresh Windows machine into something much more usable:
1. Removes pre-installed bloatware
1. Configures sane settings for things like Windows Update, privacy settings, etc.
1. Installs useful tools and applications
1. Installs software for gaming, my primary usecase for Windows these days

## How to use
1. Open elevated PowerShell prompt
1. Run: Set-ExecutionPolicy RemoteSigned
1. Get boxstarter bootstrapper
```powershell
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
```
1. Run the entrypoint script: 
```powershell
boxstarter.ps1
```

