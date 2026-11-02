PCI card information

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)  /* last two digits is a number of the bridge */
                Device (ARPT)
                {
                    Name (_ADR, Zero)
                    Name (_SUN, 0x01)    /* add this object with the same value as PCI bridge */
                      Method (_DSM, 4, NotSerialized)   /* add this method */
                    {
                        Store (Package (0x04)
                        {
                            "model",
                            Buffer ()
                            {
                                "Dell Wireless 1395"
                            },

                            "built-in",
                            Buffer ()
                            {
                                0x00
                            }

                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))   /* define the method at the top */
                        Return (Local0)
                    }