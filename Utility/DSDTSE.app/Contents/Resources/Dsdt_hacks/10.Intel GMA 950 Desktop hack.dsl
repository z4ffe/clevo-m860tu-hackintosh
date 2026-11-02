GMA 950 Desktop hack

This Hack needs the DTGP Method included in the DSDT, search for it in "DSDT Hacks".

First, you must locate the PCI code, you can use the search feature in the editor window.


Device (PCI0) /* look for the location using ioreg */
{
Name (_HID, EisaId ("PNP0A03"))
Name (_ADR, Zero)
Name (_UID, One)
Name (_BBN, Zero)


once you find it, you must include the following:


Device (PCI0) /* look for the location using ioreg */
{
Name (_HID, EisaId ("PNP0A03"))
Name (_ADR, Zero)
Name (_UID, One)
Name (_BBN, Zero)
Device (PEGP)
            {
                Name (_ADR, 0x00020000)
                Device (GFX0)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x1A)
                            {
                                "device_type", 
                                Buffer (0x08)
                                {
                                    "display"
                                }, 

                                "model", 
                                Buffer (0x07)
                                {
                                    "GMA950"
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                    0x01
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

That way we can have 3d acceleration, and resolution change using Apple's original drivers.
