 native USB EHCI Mac Pro hack

Look for the section EHCI in the DSDT code, Change the section to this code:


Device (EHCI)
{
    Name (_ADR, 0x001A0007) /*<-----------------------look for the correct address, ADR, in each DSDT */
    OperationRegion (UFCS, PCI_Config, 0x54, 0x04)
    Field (UFCS, DWordAcc, NoLock, Preserve)
    {
            ,   15, 
        PMES,   1
    }

    Device (HUB2)
    {
        Name (_ADR, Zero)
        Device (PRT1)
        {
            Name (_ADR, One)
        }

        Device (PRT2)
        {
            Name (_ADR, 0x02)
        }

        Device (PRT3)
        {
            Name (_ADR, 0x03)
        }

        Device (PRT4)
        {
            Name (_ADR, 0x04)
        }
    }

    Name (_PRW, Package (0x02)
    {
        0x0D, 
        0x03
    })
    Method (_S3D, 0, NotSerialized)
    {
        Return (0x03)
    }

    Method (_S4D, 0, NotSerialized)
    {
        Return (0x03)
    }

    Method (_DSM, 4, NotSerialized)
    {
        Store (Package (0x07)
            {
                "AAPL,current-available", 
                0x05DC, 
                "AAPL,current-extra", 
                0x03E8, 
                "AAPL,current-in-sleep", 
                0x0BB8, 
                Buffer (One)
                {
                    0x00
                }
            }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
