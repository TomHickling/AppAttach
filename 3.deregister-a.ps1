#MSIX app attach deregistration sample
#region variables 
$packageName = "VLC_1.0.0.0_x64__74tjgdb1s5w2y" 
#$packageName = "PowerBI_1.0.0.0_x64__74tjgdb1s5w2y" 
#endregion

#region derregister
Remove-AppxPackage -PreserveRoamableApplicationData $packageName 
#endregion 