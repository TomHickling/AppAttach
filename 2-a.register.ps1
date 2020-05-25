#MSIX app attach registration sample
#region variables 
#PBI
#$packageName = "PowerBI_1.0.0.0_x64__74tjgdb1s5w2y"
#VLC
$packageName = "VLC_1.0.0.0_x64__74tjgdb1s5w2y" 
 
$path = "C:\Program Files\WindowsApps\" + $packageName + "\AppxManifest.xml"
#$path = "E:\VLC\" + $packageName + "\AppxManifest.xml"

#endregion

#region register
Add-AppxPackage -Path $path -DisableDevelopmentMode -Register
#endregion 