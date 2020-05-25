#MSIX app attach de staging sample
#region variables 
$packageName = "VLC_1.0.0.0_x64__74tjgdb1s5w2y" 
#$packageName = "PowerBI_1.0.0.0_x64__74tjgdb1s5w2y"
$msixJunction = "C:\temp\AppAttach\" 
#endregion

#region derregister
Remove-AppxPackage -AllUsers -Package $packageName

cd $msixJunction 
rmdir $packageName -Force -Verbose 
#endregion 

#Dismount VHD
disMount-Diskimage -ImagePath $vhdSrc