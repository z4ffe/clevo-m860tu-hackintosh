 
To use this hack, you must first insert the "DTGP Method" (Search in the app menu for DSDT Hacks).


In this hack, we must locate the code corresponding to PCI, and place the hack where indicated below.


             
PCI Code:

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
             .................. elcódigo original continua.



PCI Code with Hack:





				Device (PCI0) 
				        { 
				            Name (_HID, EisaId ("PNP0A03")) 
				            Name (_ADR, 0x00) 
				            Name (_UID, 0x01) 
				            Name (_BBN, 0x00) 
				    Device (PEGP) // Aquí empieza el hack----------------------------------------------------
				            { 
				                Name (_ADR, 0x00060000) 
				                Device (GFX0) 
				                { 
				                    Name (_ADR, Zero) 
				                    Name (_SUN, One) 
				                    Method (_DSM, 4, NotSerialized) 
				                    { 
				                        Store (Package (0x1C) 
				                            { 
				                               "AAPL,slot-name", 
				                                Buffer (0x0D) 
				                                { 
				                                "PCI-E Slot-1" 
				                                }, 
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
				                                    /* 0000 */    0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 
				                                    /* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
				                                    /* 0010 */    0x00, 0x00, 0x00, 0x00 
				                                }, 
				                                "NVPM", 
				                                Buffer (0x20) 
				                                { 
				                                    /* 0000 */    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0018 */    0x00, 0x00, 0x00, 0x00 
				                                }, 
				                                "VRAM,totalsize", 
				                                Buffer (0x04) 
				                                { 
				                                    0x00, 0x00, 0x00, 0x20 /*<----------- 0x40 = 1024mb, 0x20= 512mb, 0x10= 256mb */
				                                }, 
				                                "device_type", 
				                                Buffer (0x0D) 
				                                { 
				                                    "NVDA,GeForce" 
				                                }, 
				                                "model", 
				                                Buffer () 
				                                { 
				                                    "POV Nvidia GeForce 8800 GT 512 MB" 
				                                }, 
				                                "rom-revision", 
				                                Buffer (0x23) 
				                                { 
				                                    "DSDT ROM v.1a by #EvOsx86 (c)"
				                                }, 
				                                "reg", 
				                                Buffer (0x78) 
				                                { 
				                                    /* 0000 */    0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x01, 0x02, 
				                                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 
				                                    /* 0028 */    0x14, 0x00, 0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0038 */    0x00, 0x00, 0x00, 0x10, 0x1C, 0x00, 0x01, 0x02, 
				                                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 
				                                    /* 0050 */    0x24, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0060 */    0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x01, 0x02, 
				                                    /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
				                                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00 
				                                } 
				                            }, Local0) 
				                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) 
				                        Return (Local0) 
				                    } 
				                } 
				            } // Here the hack ends --------------------------------------------------------------------------
				            
				
				
				
Here we show you two sections that we should configure depending on our card.				

The NVCAP should be extracted with ioregistry explorer while having our cards working correctly with QE/CI, previous to injecting it in the DSDT, to ensure you have
the correct values.

								
	
									"DSDT ROM v.1a by #EvOsx86 (c)"  // <------ Here you can change the name of your card rom

									VRAM,totalsize", 
									Buffer (0x04) 
									{ 
									    0x00, 0x00, 0x00, 0x20   //<----------- Here is the video card's memory amount
									},


									"NVCAP",    
									Buffer (0x18) 
									{ 
									    /* 0000 */    0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, //<--------- Aquí el NVCAP.
									    /* 0008 */    0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 
									    /* 0010 */    0x00, 0x00, 0x00, 0x00
	
	
