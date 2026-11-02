
Some X3100 GMA cards have a problem that needs for it to sleep before it works correctly.

If you eliminate from the DSDT the entry "CRT" inside the graphics section, the X3100 will work correctly.


Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (Arg0, MIS4)
                    SMI (0x9E, MIS4)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        0x00010100,
                        0x00010200,
                        0x00010400,
                        0x00010300
                    })
                }
/*Device (CRT)*/   /*<---------------------Eliminate this CRT  */            
                Device (LCD)
                {


You must be sure you erase the complete CRT section and respect the next "Device (xxxx)" you will find after it.