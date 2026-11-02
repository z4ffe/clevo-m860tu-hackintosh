HDA Alc889a hack.

Locate the audio (HDEF or AZALIA) in your DSDT.

An extra legacyHDA kext is needed with this hack for it to work correctly. 


Device (HDEF) /*search for entries AZAL, HDAC, AZAD etc and change them to HDEF */
{
    Name (_ADR, 0x001B0000)
    Method (_PRW, 0, NotSerialized)
    {
        Return (Package (0x02)
        {
            0x0D, 
            0x05
        })
    }

    Method (_DSM, 4, NotSerialized)
    {
        Store (Package (0x08)
            {
                "codec-id", 
                Buffer (0x04)
                {
                    0x85, 0x08, 0xEC, 0x10 /* id of the native audio  mac 885=889a (same codec)*/
                }, 

                "layout-id", 
                 Buffer (0x04)
                {
                    0x79, 0x03, 0x00, 0x00 /* the ID in profiler 889 default is 12*/
                }, 

                "device-type", 
                Buffer (0x12)
                {
                    "Realtek ALC885/9A"
                }, 

                "PinConfigurations", 
                Buffer (0x28)
                {
                    /* 0000 */    0x10, 0x40, 0x01, 0x01, 0x64, 0x10, 0x01, 0x01, 
                    /* 0008 */    0x71, 0x60, 0x01, 0x01, 0x82, 0x20, 0x01, 0x01, 
                    /* 0010 */    0x30, 0x90, 0xA1, 0x01, 0x20, 0x90, 0xA1, 0x02, 
                    /* 0018 */    0x40, 0x30, 0x81, 0x01, 0x50, 0x40, 0x21, 0x02, 
                    /* 0020 */    0xF0, 0x71, 0x44, 0x01, 0x90, 0x71, 0x45, 0x11
                }
            }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
