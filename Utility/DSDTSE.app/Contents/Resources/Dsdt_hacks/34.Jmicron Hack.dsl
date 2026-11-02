JMICRON Hack.

It is jus a cosmetic hack, it will show the Jmicron device locations on system profiler.

Locate the section that contains the code for the jmicron controller and add/replace with the following code:

Device (PEX3.JMB0)
			{
			Name (_ADR, Zero)
            OperationRegion (IDER, PCI_Config, 0x40, 0x20)
            Field (IDER, AnyAcc, NoLock, Preserve)
            {
                PFT0,   1, 
                PIE0,   1, 
                PPE0,   1, 
                PDE0,   1, 
                PFT1,   1, 
                PIE1,   1, 
                PPE1,   1, 
                PDE1,   1, 
                PRC0,   2, 
                    ,   2, 
                PIP0,   2, 
                PSIT,   1, 
                PIDE,   1, 
                SFT0,   1, 
                SIE0,   1, 
                SPE0,   1, 
                SDE0,   1, 
                SFT1,   1, 
                SIE1,   1, 
                SPE1,   1, 
                SDE1,   1, 
                SRT0,   2, 
                    ,   2, 
                SIP0,   2, 
                SSIT,   1, 
                SIDE,   1, 
                PRC1,   2, 
                PIP1,   2, 
                SRT1,   2, 
                SIP1,   2, 
                        Offset (0x08), 
                UDM0,   1, 
                UDM1,   1, 
                UDM2,   1, 
                UDM3,   1, 
                        Offset (0x0A), 
                PCT0,   2, 
                    ,   2, 
                PCT1,   2, 
                        Offset (0x0B), 
                SCT0,   2, 
                    ,   2, 
                SCT1,   2, 
                        Offset (0x14), 
                PCB0,   1, 
                PCB1,   1, 
                SCB0,   1, 
                SCB1,   1, 
                PCCR,   2, 
                SCCR,   2, 
                    ,   4, 
                PUM0,   1, 
                PUM1,   1, 
                SUM0,   1, 
                SUM1,   1, 
                PSIG,   2, 
                SSIG,   2
            }

            Device (PRT0)
            {
                Name (_ADR, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                        {
                            "io-device-location", 
                            Buffer (0x08)
                            {
                                "JM-Bay 1"
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (PRT1)
            {
                Name (_ADR, One)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                        {
                            "io-device-location", 
                            Buffer (0x08)
                            {
                                "JM-Bay 2"
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }
			}
