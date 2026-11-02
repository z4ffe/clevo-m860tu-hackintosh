Nvidia Laptop.

Locate the graphic section of your DSDT (laptop/mobile)


Example: (PEGP), it could also be AGP or IGP or something similar. (Use the ACPI search feature to locte the section, or "Registry Info" from the menu).

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


We place the hack just below of the following:

               Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                    Device (GFX0)  /* <--------------------------  Hack Begins */
                  {
                    Name (_ADR, Zero)
                    Name (_SUN, One)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x1A)
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
                                    /* 0000 */    0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 
                                    /* 0008 */    0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
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
			          0x00, 0x00, 0x00, 0x20 /*<----------- Ram Amount: 0x40 = 1024mb, 0x20= 512mb, 0x10= 256mb */
			      }, 

		                "device_type", 
		                Buffer (0x0D)
		                {
		                    "NVDA,GeForce"
		                }, 

		                "model", 
		                Buffer ()
		                {
		                    "Nvidia GeForce 8600M GS 256 MB"
		                }, 

		                "rom-revision", 
		                Buffer (0x20)
                   	     {
                        		  "DSDT ROM v.1a #irc.osx86.es (c)"
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


Here we can change the name:


Buffer ()
{
    "Nvidia GeForce 8600M GS 256 MB"
},


Here the NVCAP:


"NVPM", 
Buffer (0x20)
{
    /* 0000 */    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    /* 0018 */    0x00, 0x00, 0x00, 0x00
}, 

Here the Ram amount of the card.


"VRAM,totalsize", 
Buffer (0x04)
{
0x00, 0x00, 0x00, 0x20 /*<----------- Ram Amount: 0x40 = 1024mb, 0x20= 512mb, 0x10= 256mb */
},
        
