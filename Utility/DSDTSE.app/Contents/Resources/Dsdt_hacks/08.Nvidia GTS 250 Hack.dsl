Nvidia GTS 250 Hack

This hack needs the DTGP method included in the DSDT, search for it in the "DSDT Hacks" on the menu.

Locate the PCI section in your DSDT.


Device (PCI0) 
        { 
            Name (_HID, EisaId ("PNP0A03")) 
            Name (_ADR, 0x00) 
            Name (_UID, 0x01) 
            Name (_BBN, 0x00) 
            Method (_S3D, 0, NotSerialized) 
            { 
                If (LEqual (OSFL, 0x02)) 
                { 
                    Return (0x02) 
                } 
                Else 
                { 
                    Return (0x03) 
                } 
             .................. the original code continues.




PCI code with hack:





				Device (PCI0) 
				        { 
				            Name (_HID, EisaId ("PNP0A03")) 
				            Name (_ADR, 0x00) 
				            Name (_UID, 0x01) 
				            Name (_BBN, 0x00) 
                Device (P0P1)  /* ------------------------------  the hack begins here */
            {
                Name (_ADR, 0x00010000)
				Device (GFX)
                {
                    Name (_ADR, Zero)
                    Name (_SUN, One)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x16)
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

                                "NVCAP", 
                                Buffer (0x18)
                                {
                                    /* 0000 */    0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 
                                    /* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
                                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                                }, 

                                "VRAM,totalsize", 
                                Buffer (0x04)
                                {
                                    0x00, 0x00, 0x00, 0x20
                                }, 

                                "device_type", 
                                Buffer (0x0C)
                                {
                                    "NVDA,Parent"
                                }, 

                                "model", 
                                Buffer ()
                                {
                                    "NVIDIA GeForce GTS 250"
                                }, 

                                "rom-revision", 
                                Buffer (0x06)
                                {
                                    "3386a"
                                }
                            }, Local0)
                        SHIT (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }
            }




Here we show you three sections that you must configure depending on your video card.


The NVCAP should be extracted with ioregistry explorer while having our cards working correctly with QE/CI, previous to injecting it in the DSDT, to ensure you have
the correct values.


			"NVIDIA GeForce GTS 250" /* <------ Here you can change the name of your Card */

				VRAM,totalsize", 
					Buffer (0x04) 
				{ 
					0x00, 0x00, 0x00, 0x20   /*<----------- Ram amount: 0x40 = 1024mb, 0x20= 512mb, 0x10= 256mb */
				},


					"NVCAP",    
				Buffer (0x18) 
				{ 
				 /* 0000 */    0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, //<--------- Here the NVCAP.
				/* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
				/* 0010 */    0x00, 0x00, 0x00, 0x00


