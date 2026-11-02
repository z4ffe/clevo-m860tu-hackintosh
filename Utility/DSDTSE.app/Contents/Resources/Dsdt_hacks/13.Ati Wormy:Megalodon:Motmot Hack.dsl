Ati Wormy/Megalodon/Motmot Hack.

This hack needs the DTGP method included in the DSDT, search for it in the "DSDT Hacks" on the menu.

Fror this hack, we must locate the corresponding code for PCI and place the hack where indicated.


             
Código PCI:

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
			Device (GFX0)
			{
			    Name (_ADR, Zero)
			    Name (_SUN, One) 
  			    Method (_DSM, 4, NotSerialized)
			                    {
			                        Store (Package (0x1E)
			                            {
			                                "@0,compatible", 
			                                Buffer (0x0B)
			                                {
			                                    "ATY,Motmot" /* <-----Change your framebuffer to the one you need (Wormy, Megalodon, Motmot) */
			                                }, 

			                                "@0,deviceType", 
			                                Buffer (0x08)
			                                {
			                                    "display"
			                                }, 

			                                "@0,VRAM,memsize", 
			                                Buffer (0x04)
			                                {
			                                    0x00, 0x00, 0x00, 0x40
			                                }, 

			                                "@0,display-connect-flags", 
			                                Buffer (0x02)
			                                {
			                                    0x00, 0x04
			                                }, 

			                                "@0,name", 
			                                Buffer (0x0E)
			                                {
			                                    "ATY,Display_A"
			                                }, 

			                                "@1,compatible", 
			                                Buffer (0x0B)
			                                {
			                                    "ATY,Motmot"  /* <-----Change your framebuffer to the one you need (Wormy, Megalodon, Motmot) */
			                                }, 

			                                "@1,device_type", 
			                                Buffer (0x08)
			                                {
			                                    "display"
			                                }, 

			                                "@1,VRAM,memsize", 
			                                Buffer (0x08)
			                                {
			                                    0x00, 0x00, 0x00, 0x40
			                                }, 

			                                "@1,display-connect-flags", 
			                                Buffer (0x02)
			                                {
			                                    0x00, 0x04
			                                }, 

			                                "@1,name", 
			                                Buffer (0x0E)
			                                {
			                                    "ATY,Display_B"
			                                }, 

			                                "ATY,Card#", 
			                                Buffer (0x0E)
			                                {
			                                    "109-B148xx-00"
			                                }, 

			                                "ATY,Rom#", 
			                                Buffer (0x0F)
			                                {
			                                    "113-B1480A-236"
			                                }, 

			                                "device_type", 
			                                Buffer (0x11)
			                                {
			                                    "ATY,MotmotParent" /* <--Change your framebuffer to the one you need (Wormy, Megalodon, Motmot) */
			                                }, 

			                                "VRAM,totalsize", 
			                                Buffer (0x04)
			                                {
			                                    0x00, 0x00, 0x00, 0x40  /*<-----------Ram Amount: 0x40 = 1024mb, 0x20= 512mb, 0x10= 256mb */
			                                }, 

			                                "model", 
			                                Buffer ()
			                                {
			                                    "ATI Radeon HD 4890 Series" /* Change name here  */
			                                }
			                            }, Local0)
			                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
			                        Return (Local0)
			                    }
			               }