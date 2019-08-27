
#---- TEMPORARY ---
Disable-UAC

#--- Windows Settings ---
Disable-BingSearch
Disable-GameBarTips

#--- Uninstall unecessary applications that come with Windows out of the box ---

# removes all pre-installed Apps except the Microsoft Store app, so you can re-install any Apps you might want
Get-AppxPackage -AllUsers | where-object {$_.name –notlike "*store*"} | Remove-AppxPackage

# Uninstall McAfee Security App
$mcafee = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "McAfee Security" } | select UninstallString
if ($mcafee) {
	$mcafee = $mcafee.UninstallString -Replace "C:\Program Files\McAfee\MSC\mcuihost.exe",""
	Write "Uninstalling McAfee..."
	start-process "C:\Program Files\McAfee\MSC\mcuihost.exe" -arg "$mcafee" -Wait
}

#--- Restore Temporary Settings ---
Enable-UAC
