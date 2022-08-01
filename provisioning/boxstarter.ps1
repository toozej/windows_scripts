# entrypoint into windows provisioning scripts

#---- TEMPORARY ---
Disable-UAC

#--- Remove Unneeded Preinstalled Windows Packages ---
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\provision_windows_remove_preinstalled_packages.ps1"))

#--- Fix Windows Settings ---
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\provision_windows_fix_settings.ps1"))

#--- Install Windows Apps and Tools ---
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\provision_windows_tools_apps.ps1"))

#--- Install Windows Gaming Apps ---
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\provision_windows_gaming.ps1"))

#--- Install Windows Development Tools ---
Invoke-Item (start powershell ((Split-Path $MyInvocation.InvocationName) + "\provision_windows_dev_tools.ps1"))

#--- Restore Temporary Settings ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

#--- Rename the Computer ---
# Requires restart, or add the -Restart flag
$computername = "insertinterestingpcnamehere"
if ($env:computername -ne $computername) {
	Rename-Computer -NewName $computername
}
