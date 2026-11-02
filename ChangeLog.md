# Changle Log

## 14.10.2010

- Firewire disable fix
- HDMI fix to works
- Some fix to GFX0 (Geforce 9800M GTS)
- GPE Section fix
- PCI Card information cosmetic fix
- HDEF section add to works native AppleHDA (for patch kept look kit)
- Add new Bootloader (Chameleon RC2 r593) to kit
- Add new smbios information (memory/motherboard)

## 26.12.2010

- OSYS Method fix
- HDMI video fix, but without sound
- Replace voodoohda to AppleHDA (all in/out but without SPDIF (node: 30-6))
- Correct HDEF section for applehda error
- More cosmetic DSDT fixes
- Speedstep working now with bootloader (GeneratedP/S States)
- Replace VoodooBattery to new x64_86 AppleACPIBatteryManager (Without kernel panic)
- Replace old ApplePS2.kext and VoodooPS2 to new VoodooPS2.kext
- MacModel changed from MacBookPro5,1 to MacBookPro5,3
- Correct APD, BAT and other section in DSDT
- Correct EHC section to device-internal
- Correct UHC2 (PSW Method) Bluetooth now sleep!
- Add new bootloader to Kit (Chameleon r650 by Trunk)
- New PRW in _GPE for USB
- New FireWire _DSM method
- Cosmetic DSM method in GIGE (ethernet)
- New FakeSMC (NVClockX, IntelCPUMonitor) by mozo, usr-sse2 and Slice
- And more little fixes :)
- With Happy New Year Guys!

## 19.01.2011

- Delete IPIC interrupt (I think it's better)
- DTGP change to MCDP
- Add subsystem-id and subsystem-vendor-id to _DSM methods like in real MacBook Pro
- Delete injected for GIGE-Ethernet
- Some changes in SMBus
- Little fixes in DSDT

## 18.04.2011

- Delete subsystem, vendorid and other trash
- Replace PNLF device
- Delete some section from GFX
- Delete GenerateP/C States from SMBios.plist (SSDT from BIOS better than generated)