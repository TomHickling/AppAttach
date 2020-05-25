#Go and package your app using the MSIX App packager

#Generate a VHD or VHDX package for MSIX
#vlc
new-vhd -sizebytes 2048MB -path C:\ApplicationVHDs\VLC.vhdx -dynamic -confirm:$false
$vhdObject = Mount-VHD C:\ApplicationVHDs\VLC.vhdx -Passthru
$disk = Initialize-Disk -Passthru -Number $vhdObject.Number
$partition = New-Partition -AssignDriveLetter -UseMaximumSize -DiskNumber $disk.Number
Format-Volume -FileSystem NTFS -Confirm:$false -DriveLetter $partition.DriveLetter -Force
#Create a folder with your Appname as the name of the folder in root drive mounted above
new-item -path 'E:\VLC' -ItemType Directory

#powerbi
new-vhd -sizebytes 4096MB -path C:\ApplicationVHDs\powerbi.vhdx -dynamic -confirm:$false
$vhdObject = Mount-VHD C:\ApplicationVHDs\powerbi.vhdx -Passthru
$disk = Initialize-Disk -Passthru -Number $vhdObject.Number
$partition = New-Partition -AssignDriveLetter -UseMaximumSize -DiskNumber $disk.Number
Format-Volume -FileSystem NTFS -Confirm:$false -DriveLetter $partition.DriveLetter -Force
#Create a folder with your Appname as the name of the folder in root drive mounted above
new-item -path 'E:\PowerBI' -ItemType Directory


#Expand MSIX in CMD in Admin cmd prompt - Get the full package name
cd applicationtools\msixmgr\x64
#powerbi
msixmgr.exe -Unpack -packagePath "C:\Applicationsmsix\PowerBI\PowerBI_1.0.0.0_x64__74tjgdb1s5w2y.msix" -destination "E:\PowerBI" -applyacls
#vlc
msixmgr.exe -Unpack -packagePath "C:\Applicationsmsix\VLC\VLC_1.0.0.0_x64__74tjgdb1s5w2y.msix" -destination "E:\VLC" -applyacls


#Cert
New-SelfSignedCertificate -Type CodeSigningCert -Subject "CN=TomHickling"