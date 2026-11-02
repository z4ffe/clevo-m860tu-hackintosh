This hack will allow you to use the FN button on laptop and allow Leopard/Snowleopard recognize it as a laptop keyboard.

This is the code:

Method (_DSM, 4, NotSerialized)  
                {
                    Store (Package ()
                        {

                            "AAPL,has-embedded-fn-keys",
                            Buffer (0x04)
                            {
                                0x01, 0x00, 0x00, 0x00
                            }

                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

Locate the PS2K controller on your DSDT and add the code under the "Name..."

This code has to end like this:

              Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, EisaId ("PNP030B"))
                    Method (_DSM, 4, NotSerialized)   /* Added code start.  */
                                    {
                                        Store (Package ()
                                            {

                                                "AAPL,has-embedded-fn-keys",
                                                Buffer (0x04)
                                                {
                                                    0x01, 0x00, 0x00, 0x00
                                                }

                                            }, Local0)
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }                    /* End of added code  */
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })