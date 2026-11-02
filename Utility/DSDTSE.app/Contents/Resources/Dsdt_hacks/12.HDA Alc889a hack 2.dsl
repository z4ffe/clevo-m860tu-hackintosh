ALC HDEF 889a hack   



Vanilla audio is possible with the EP45-UD3P for 10.5 through 10.6 using layout-id “66″ found in all appleHDAs and an ioreg reported pin config. Line-out is through the green jack in back through all Leopard iterations, and works in 32 and 64 bit Snow. Line-in, digital out (and in from the header with a bracket) are the same. I can't speak to mic out (rear jack) nor headphone. It's not the most complete solution but it is “foolproof”, completely kextless, and so far update-unbreakable.  





            Device (HDEF)
            {
                Name (_ADR, 0×001B0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0×02)
                    {
                        0×0D,
                        0×05
                    })
                }

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0×08)
                        {
                            “codec-id”,
                            Buffer (0×04)
                            {
                                0×85, 0×08, 0xEC, 0×10
                            },

                            “layout-id”,
                            Unicode (”B”),
                            “device-type”,
                            Buffer (0×11)
                            {
                                “ALC889a”
                            },

                            “PinConfigurations”,
                            Buffer (0×28)
                            {
                                /* 0000 */    0×10, 0×90, 0xA0, 0×90, 0×20, 0×90, 0xA1, 0×02,
                                /* 0008 */    0×80, 0×30, 0×81, 0×01, 0×90, 0×40, 0×21, 0×02,
                                /* 0010 */    0×30, 0×40, 0×11, 0×01, 0×40, 0×10, 0×01, 0×01,
                                /* 0018 */    0×50, 0×60, 0×01, 0×01, 0×60, 0×20, 0×01, 0×01,
                                /* 0020 */    0×70, 0×61, 0×4B, 0×01, 0xA0, 0×01, 0xCB, 0×01
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Method (DTGP, 5, NotSerialized)
                {
                    If (LEqual (Arg0, Buffer (0×10)
                            {
                                /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0×18, 0×13, 0×1C, 0×44,
                                /* 0008 */    0xB0, 0xC9, 0xFE, 0×69, 0×5E, 0xAF, 0×94, 0×9B
                            }))
                    {
                        If (LEqual (Arg1, One))
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Store (Buffer (One)
                                    {
                                        0×03
                                    }, Arg4)
                                Return (One)
                            }

                            If (LEqual (Arg2, One))
                            {
                                Return (One)
                            }
                        }
                    }

                    Store (Buffer (One)
                        {
                            0×00
                        }, Arg4)
                    Return (Zero)
                }
            }