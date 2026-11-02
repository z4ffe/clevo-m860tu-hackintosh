Native SATA AHCI hack

Locate the SATA section in your DSDT:

Add /replace with this code.




Device (SATA)
    {
        Name (_ADR, 0x001F0002)
		Name (_SUN, One)
        Device (PRT0)
        {
            Name (_ADR, Zero)
			Method (_GTF, 0, NotSerialized)
            {
            	Name (PIB0, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xF5
                })
                Return (PIB0)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {
						
						
                        "io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 1"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
			 
        }

        Device (PRT1)
        {
            Name (_ADR, One)
			Method (_GTF, 0, NotSerialized)
            {
                Name (PIB1, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xF5
                })
                Return (PIB1)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {
														
                        "io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 2"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
			
        }

        Device (PRT2)
        {
            Name (_ADR, 0x02)
			Method (_GTF, 0, NotSerialized)
            {
                Name (PIB2, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xF5
                })
                Return (PIB2)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {
						"io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 3"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (PRT3)
        {
            Name (_ADR, 0x03)
			Method (_GTF, 0, NotSerialized)
            {
                Name (PIB3, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xF5
                })
                Return (PIB3)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {
					
						
                        "io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 4"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (PRT4)
        {
            Name (_ADR, 0x04)
			Method (_GTF, 0, NotSerialized)
            {
                Name (PIB4, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xF5
                })
                Return (PIB4)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {	
											
                        "io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 5"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (PRT5)
        {
            Name (_ADR, 0x05)
			Method (_GTF, 0, NotSerialized)
            {
                Name (PIB5, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xF5
                })
                Return (PIB5)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Store (Package (0x02)
                    {
												
                        "io-device-location", 
                        Buffer (0x06)
                        {
                            "Bay 6"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

		Method (_DSM, 4, NotSerialized)
        {
            Store (Package (0x06)
                {
                    "device_type", 
                    Buffer (0x10)
                    {
                        "AHCI Controller"
                    }, 
												
                    "model", 
                    Buffer (0x1C)
                    {
                        "ICH9-R SATA/AHCI Controller"
                    }, 

                    "name", 
                    Buffer (0x1C)
                    {
                        "ICH9-R SATA/AHCI Controller"
                    }
                }, Local0)
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }

