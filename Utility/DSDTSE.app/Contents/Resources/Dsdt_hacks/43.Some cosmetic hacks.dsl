Some cosmetic hacks:



                 Device (SMC)  // We will be faking up some of SMC Devices which are used in MacBookAir
	          {
          	    Device (ALS0) // Ambient Light Sensor , we'll be faking this up , to get the ambient sensor to work , will find a way to link with cam
                    {
                     Name (_HID, "ACPI0008") //The ID used in macbook air
                     Name (_CID, "smc-als") // The one which talks with the ALS kext
                     Method (_ALI, 0, NotSerialized)
                      {
                       Return (0x012C)
                      }

                    Name (_ALR, Package (0x03)
                     {
                      Package (0x02)
                      {
                       0x46, 
                       0x00
                      }, 

                     Package (0x02)
                     {
                       0x64, 
                       0x012C
                     }, 

                    Package (0x02)
                    {
                       0x96, 
                       0x03E8
                    }
                  })
                }


Another cosmetic hack:

              Device (SMS0)  //Faking Sudden Motion Sensor Here 
                 {
                   Name (_HID, EisaId ("APP0003"))  // ID which is used in macbook air
                   Name (_CID, "smc-sms") // This talks with the SMS kext
		   Method (_ALI, 0, NotSerialized)
		     {
		     Return (0x012C)
		     }
                   Method (_DSM, 4, NotSerialized)  // We are going to fake the disk-sense level so that it doesnt lock up our drives 
		    {
		      Store (Package (0x03)
		    {
		     "disk-sense-level", 
		      0x01, 
		      Buffer (0x01)
		       {
		        0x00
		       }
		     }, Local0)
		   DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
		   Return (Local0)
                  }                        
                }

