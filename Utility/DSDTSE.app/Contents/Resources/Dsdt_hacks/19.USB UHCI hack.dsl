USB UHCI hack.

Locate the USB zone in the DSDT code and change it with the following:

Device (UHCI)
{
    Name (_ADR, 0x001D0000)    /*<-------------look for the correct addres, ADR, in each DSDT*/
    OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
    Field (U1CS, DWordAcc, NoLock, Preserve)
    {
        UIEN,   2
    }

    Device (HUBI)
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
    }

    Name (_PRW, Package (0x02)
    {
        0x03, 
        0x03
    })
    Method (_PSW, 1, NotSerialized)
    {
        If (Arg0)
        {
            Store (0x03, UIEN)
        }
        Else
        {
            Store (Zero, UIEN)
        }
    }

    Method (_S3D, 0, NotSerialized)
    {
        Return (0x03)
    }

    Method (_S4D, 0, NotSerialized)
    {
        Return (0x03)
    }
}
