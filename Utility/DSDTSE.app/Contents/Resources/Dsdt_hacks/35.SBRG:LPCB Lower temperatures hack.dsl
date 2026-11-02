Lower temperatures SBRG/LPCB hack


This will allow you to have a proper LPC device registered under OSX.
It will lower your CPU temperature when using Native speedstep. (Appleintelcpupowermanagement).

Be sure to add your hardware´s LPC id to AppleLPC.kext and add this code into your DSDT.

If you get audio stuttering or audio glitches with this fix, then You have also to remove the IRQ to
Device (TMR)/(TIMR) and Device (PIC)/(IPIC)




Locate Device (SBRG) or Device (LPCB) and add the hacked id:


Device (SBRG) /* Also known as  Device (LPCB) */
            {
                Name (_ADR, 0x001F0000)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                        {
                            "device-id",
                            Buffer (0x04)
                            {
                                0x18, 0x3A, 0x00, 0x00 /* hack the ID.. */
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }