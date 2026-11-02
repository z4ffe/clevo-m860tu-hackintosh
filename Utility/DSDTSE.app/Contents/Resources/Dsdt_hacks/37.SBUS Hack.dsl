SBUS Hack

This hack will properly load SBUS device onto your registry.

Simply locate SBUS device by name or by adress (0x001F0003), then add this code:


            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x04)
                    {
                        "name", 
                        "pci8086,3a30", 
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x30, 0x3A, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }



Example:


Device (SBUS)
        {
            Name (_ADR, 0x001F0003)
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x04)
                    {
                        "name", 
                        "pci8086,3a30", 
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x30, 0x3A, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
            Field (SMBP, DWordAcc, NoLock, Preserve)
            {
                    ,   2, 
                I2CE,   1
            }

            OperationRegion (SMBI, SystemIO, 0x1C00, 0x10)
            Field (SMBI, ByteAcc, NoLock, Preserve)
            {
                HSTS,   8,