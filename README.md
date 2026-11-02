Clevo M860TU Mac OS X Kit.

Autor:
ZAFFE
Email: pavel.kulyasov@gmail.com
ICQ: 1241623

System info:
Intel Core 2 Duo T 9400 2.53Ghz
DDR3 1066Hz Transcend
Nvidia GeForce 9800M GTS
Realtek ALC662
Intel ICH9M Chipset

Composition set:
1. Extra folder with DSDT, SMBios, com.apple.boot.plist files.
DSDT have fixes: HPET,RTC, LPC, SMBus, SATA, USB, Darwin, PNLF, GFX, HDEF, FRWR, PCI.
2. Extension folder with kexts. (AppleACPIBatteryManager, AppleHDA, FakeSMC, VoodooPS2)
3. Chameleon folder with Chameleon r650 bootloader by Trunk
4. Programms folder with some programs for hack OS X (CPU-X, SystemInfo, DSDTSE, EFI Partition, IORegExplorer, Kext Utility, PlistEdit Pro, Show-Hide Files, Xbench)

Install:
1. Copy folder Extra to disk with bootloader. 
    Example: Macintosh HD/Extra/
2. Install kexts from folder Extensions with help Kext Utility.
3. Repair permission with Disk Utility and reboot.
4. ?????
5. PROOFIT!
And buy for me beer :D


PS: Use Chameleon r650 bootloader!
Install bootloader to EFI partition or another!

Firtst: Run terminal and see 'diskutil list' you list partition:

89:~ zaffe$ diskutil list
/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *320.1 GB   disk0
   1:                        EFI                         209.7 MB   disk0s1
   2:                  Apple_HFS Macintosh HD            53.7 GB    disk0s2
   3:                  Apple_HFS Documents               211.6 GB   disk0s3
   4:                  Apple_HFS Time Machine            54.1 GB    disk0s4

My EFI partition on disk0s1, if you have system disk 1 or 2 you EFI partition on disk1s1 or disk2s1 etc.

1. Run terminal
2. Type sudo -s, enter password and enter.
3. Format EFI partition: newfs_hfs -v EFI /dev/disk0s1
4. Mount EFI partition:
     mkdir /Volumes/EFI
     mount_hfs /dev/disk0s1 /Volumes/EFI
5. Creat file structure:
    mkdir -p /Volumes/EFI/Extra/Extensions
6. Load bootloader to EFI partition:
    cd /Users/zaffe/Desktop/AsereBLN\ 1.1.9
    fdisk -f boot0 -u -y /dev/rdisk0
    dd if=boot1 of=/dev/rdisk0s1
    cp boot /Volumes/EFI
7. Unmount EFI partition:
    unmount -f /Volumes/EFI
    rm -rf /Volumes/EFI
8. FIx error at EFI:
    fsck_hfs /dev/disk0s1

Okay bootloader install to EFI partition, next make EFI active partition.

1. diskutil list
2. EFI disk0s1 (similar)

fdisk -e /dev/disk0           (disk0 = disk0s1)
p
f 1       (f1 = disk0s1)
w
y
q

For upload DSDT,plist's and other on EFI part use EFI Partition.app.



