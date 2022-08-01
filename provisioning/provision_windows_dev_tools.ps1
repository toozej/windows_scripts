#--- Fonts ---
choco install inconsolata -y

#--- Windows Subsystems/Features ---
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Dev ---
choco install docker-desktop -y
choco install git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"' -y
choco install git
choco install poshgit
choco install ag
