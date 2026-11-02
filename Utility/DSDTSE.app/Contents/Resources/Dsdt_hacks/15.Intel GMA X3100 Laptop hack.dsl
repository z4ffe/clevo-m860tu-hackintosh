Intel GMA X3100 Laptop hack

Locate the graphics section of your DSDT (laptop/mobile)

Example: (PEGP), it could also be AGP or IGP or something similar. (Use the search feature to locate the section or "Registry Info from the menu")

Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                         .........  the code continues...............

The hack should be placed just below of the following code:

               Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                    Device (GFX)   /*  <------------- Hack begins */
					{
					  Name (_ADR, Zero)
					  Method (_DSM, 4, NotSerialized)
						{
							Store (Package (0x54)
							{

								"device_type", 
					            Buffer (0x08)
					            {
					                "display"
					            },

								"model", 
					            Buffer (0x0D)
					            {
					              "X3100"
					            },

								"built-in",
								Buffer (One)
								{
									0x01
								},

								"AAPL,backlightRestore", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL,DisplayConfig", 
					            Buffer (0x20)
					            {
					               /* 0000 */ 	0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
								   /* 0008 */	0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
					               /* 0010 */	0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
								   /* 0018 */	0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
					            },

								"AAPL,HasLid", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL,HasPanel", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL,NumDisplays", 
					            Buffer (0x04)
					            {
					                0x04, 0x00, 0x00, 0x00
					            },

								"AAPL,NumFramebuffers", 
					            Buffer (0x04)
					            {
					                0x02, 0x00, 0x00, 0x00
					            },

								"AAPL,SelfRefreshSupported", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL,aux-power-connected", 
					            Buffer (0x04)
					            {
					            	0x01, 0x00, 0x00, 0x00
					            },

								"AAPL,backlight-control", 
					            Buffer (0x04)
					            {
					            	0x01, 0x00, 0x00, 0x00
					            },

								"AAPL00,blackscreen-preferences", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x08
					            },

								"AAPL01,BacklightIntensity", 
					            Buffer (0x04)
					            {
					                0x64, 0x00, 0x00, 0x00
					            },

								"AAPL01,blackscreen-preferences", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x08
					            },

								"AAPL01,BootDisplay", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL01,CurrentDisplay", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,DataJustify", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL01,Depth", 
					            Buffer (0x04)
					            {
					                0x20, 0x00, 0x00, 0x00
					            },

								"AAPL01,Dither", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,DualLink", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL01,EDID", 
					            Buffer (0x80)
					            {
					                /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
					                /* 0008 */    0x06, 0x10, 0x5f, 0x9c, 0x00, 0x00, 0x00, 0x00, 
					                /* 0010 */    0x08, 0x10, 0x01, 0x03, 0x80, 0x1d, 0x12, 0x78, 
					                /* 0018 */    0x0A, 0x2f, 0x30, 0x97, 0x58, 0x53, 0x8b, 0x29, 
					                /* 0020 */    0x25, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01, 
					                /* 0028 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
					                /* 0030 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xBC, 0x1B, 
					                /* 0038 */    0x00, 0xA0, 0x50, 0x20, 0x17, 0x30, 0x30, 0x20, 
					                /* 0040 */    0x36, 0x00, 0x1E, 0xB3, 0x10, 0x00, 0x00, 0x18, 
					                /* 0048 */    0x00, 0x00, 0x00, 0x0F, 0x00, 0x06, 0x10, 0x20, 
					                /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
					                /* 0058 */    0x0A, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x4C, 
					                /* 0060 */    0x54, 0x31, 0x33, 0x33, 0x57, 0x58, 0x31, 0x2D, 
					                /* 0068 */    0x00, 0x43, 0x41, 0x31, 0x00, 0x00, 0x00, 0xFE, 
					                /* 0070 */    0x00, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x20, 0x4C, 
					                /* 0078 */    0x43, 0x44, 0x0A, 0x20, 0x20, 0x20, 0x00, 0xC2
					            },

								"AAPL01,Height", 
					            Buffer (0x04)
					            {
					                0x20, 0x03, 0x00, 0x00
					            },

								"AAPL01,Interlace", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,Inverter", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,InverterCurrent", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,InverterFrequency", 
					            Buffer (0x04)
					            {
					                0x08, 0x52, 0x00, 0x00
					            },

								"AAPL01,IODisplayMode", 
					            Buffer (0x04)
					            {
					                0x00, 0x10, 0x00, 0x80
					            },

								"AAPL01,LinkFormat", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,LinkType", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },				

								"AAPL01,Pipe", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            },

								"AAPL01,PixelFormat", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,Refresh", 
					            Buffer (0x04)
					            {
					                0x3B, 0x00, 0x00, 0x00
					            },

								"AAPL01,Stretched", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,T0", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            },

								"AAPL01,T1", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            }, 

					            "AAPL01,T2", 
					            Buffer (0x04)
					            {
					                0xC8, 0x00, 0x00, 0x00
					            }, 

					            "AAPL01,T3", 
					            Buffer (0x04)
					            {
					                0xC8, 0x00, 0x00, 0x00
					            }, 

					            "AAPL01,T4", 
					            Buffer (0x04)
					            {
					                0x01, 0x00, 0x00, 0x00
					            }, 

					            "AAPL01,T5", 
					            Buffer (0x04)
					            {
					                0x00, 0x00, 0x00, 0x00
					            }, 

					            "AAPL01,T6", 
					            Buffer (0x04)
					            {
					                0x90, 0x01, 0x00, 0x00
					            }, 

								"AAPL01,Width", 
					            Buffer (0x04)
					            {
					                0x00, 0x05, 0x00, 0x00
					            }

					 		}, Local0)
						DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
					Return (Local0)
					}
					}

					