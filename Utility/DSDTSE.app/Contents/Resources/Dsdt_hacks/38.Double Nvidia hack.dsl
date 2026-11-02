Just locate your PCI0 device and add the code, be sure to setup your Nvcap correctly.



Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Name (_BBN, Zero)
            Method (_INI, 0, NotSerialized)
            {
                If (CondRefOf (_OSI, Local0))
                {
                    Store (0x21, OSTY)
                }
            }

            Device (PEG1)                       /* Here begins the addons */
            {
                Name (_ADR, 0x00010000)
                Name (PPS1, Package (0x02)
                {
                    0x0B, 
                    0x04
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (PPS1)
                }

                Device (GFX1)
                {
                    Name (_ADR, Zero)
                    Name (_SUN, 0x0B)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x26)
                            {
                                "@0,compatible", 
                                Buffer (0x0B)
                                {
                                    "NVDA,NVMac"
                                }, 

                                "@0,device_type", 
                                Buffer (0x08)
                                {
                                    "display"
                                }, 

                                "@0,name", 
                                Buffer (0x0F)
                                {
                                    "NVDA,Display-A"
                                }, 

                                "@1,compatible", 
                                Buffer (0x0B)
                                {
                                    "NVDA,NVMac"
                                }, 

                                "@1,device_type", 
                                Buffer (0x08)
                                {
                                    "display"
                                }, 

                                "@1,name", 
                                Buffer (0x0F)
                                {
                                    "NVDA,Display-B"
                                }, 

                                "@2,#adress-cells", 
                                Buffer (0x0B)
                                {
                                    "0x01000000"
                                }, 

                                "@2,#size-cells", 
                                Buffer (0x0B)
                                {
                                    "0x00000000"
                                }, 

                                "@2,compatible", 
                                Buffer (0x13)
                                {
                                    "NVDA,sensor-parent"
                                }, 

                                "@2,device_type", 
                                Buffer (0x0F)
                                {
                                    "NVDA,gpu-diode"
                                }, 

                                "@2,hwctrl-params-version", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "@2,hwsensor-params-version", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "@2,name", 
                                Buffer (0x0E)
                                {
                                    "sensor-parent"
                                }, 

                                "@2,reg", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "NVCAP", 
                                Buffer (0x14)
                                {
                                    /* 0000 */    0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 
                                    /* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
                                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                                }, 

                                "NVPM", 
                                Buffer (0x1C)
                                {
                                    /* 0000 */    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0018 */    0x00, 0x00, 0x00, 0x00
                                }, 

                                "device_type", 
                                Buffer (0x0C)
                                {
                                    "NVDA,Parent"
                                }, 

                                "model", 
                                Buffer (0x20)
                                {
                                    "NVIDIA Geforce Series (Primary)"
                                }, 

                                "rom-revision", 
                                Buffer (0x06)
                                {
                                    "3169a"
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

            Device (PEG3)    /* On some motherboards, this should be (PEG6), try. */
            {
                Name (_ADR, 0x00030000)
                Name (PPS1, Package (0x02)
                {
                    0x0B, 
                    0x04
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (PPS1)
                }

                Device (GFX3)
                {
                    Name (_ADR, Zero)
                    Name (_SUN, 0x0C)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x26)
                            {
                                "@0,compatible", 
                                Buffer (0x0B)
                                {
                                    "NVDA,NVMac"
                                }, 

                                "@0,device_type", 
                                Buffer (0x08)
                                {
                                    "display"
                                }, 

                                "@0,name", 
                                Buffer (0x0F)
                                {
                                    "NVDA,Display-A"
                                }, 

                                "@1,compatible", 
                                Buffer (0x0B)
                                {
                                    "NVDA,NVMac"
                                }, 

                                "@1,device_type", 
                                Buffer (0x08)
                                {
                                    "display"
                                }, 

                                "@1,name", 
                                Buffer (0x0F)
                                {
                                    "NVDA,Display-B"
                                }, 

                                "@2,#adress-cells", 
                                Buffer (0x0B)
                                {
                                    "0x01000000"
                                }, 

                                "@2,#size-cells", 
                                Buffer (0x0B)
                                {
                                    "0x00000000"
                                }, 

                                "@2,compatible", 
                                Buffer (0x13)
                                {
                                    "NVDA,sensor-parent"
                                }, 

                                "@2,device_type", 
                                Buffer (0x0F)
                                {
                                    "NVDA,gpu-diode"
                                }, 

                                "@2,hwctrl-params-version", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "@2,hwsensor-params-version", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "@2,name", 
                                Buffer (0x0E)
                                {
                                    "sensor-parent"
                                }, 

                                "@2,reg", 
                                Buffer (0x0B)
                                {
                                    "0x02000000"
                                }, 

                                "NVCAP", 
                                Buffer (0x14)
                                {
                                    /* 0000 */    0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 
                                    /* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
                                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                                }, 

                                "NVPM", 
                                Buffer (0x1C)
                                {
                                    /* 0000 */    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                    /* 0018 */    0x00, 0x00, 0x00, 0x00
                                }, 

                                "device_type", 
                                Buffer (0x0C)
                                {
                                    "NVDA,Parent"
                                }, 

                                "model", 
                                Buffer (0x22)
                                {
                                    "NVIDIA Geforce Series (Secondary)"
                                }, 

                                "rom-revision", 
                                Buffer (0x06)
                                {
                                    "3169a"
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }