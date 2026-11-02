Time machine FIX.
This hack requires the DTGP method included in the code, check "DSDT Hacks" to find it

First you must find your network card in the registry, using the search feature or use "Registry Info" from the app window to locate it


"Realtek RTL8111/8168B PCI-E Gigabit" is the name used in this example: use your own card's name in the final code.

Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                 Contents.....
                }

                Device (PXS3) // Address of the network card in this example
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })

                }

Once located, you must add the following code before the last bracket: (if there is any more code, add the time machine fix just below this section).





                  Method (_DSM, 4, NotSerialized) 
					{
					  Store (Package (0x06) 
					      { 
					        "built-in", 
					         Buffer (One) 
					        { 
					         0x01 
					        }, 

					       "device_type", 
					        Buffer (0x09) 
					        { 
					           "ethernet" 
					        }, 
					           "name", 
					        Buffer (0x24) 
					        { 
					           "Realtek RTL8111/8168B PCI-E Gigabit" 
					        } 
					      }, Local0) 
					      DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) 
					      Return (Local0) 
					  } 
					


It should end up in this way:



 Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                 Contents.....
                }

                Device (PXS3) // Address of the network card in this example.
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })  
  
					 Method (_DSM, 4, NotSerialized) 
					{
					  Store (Package (0x06) 
					      { 
					        "built-in", 
					         Buffer (One) 
					        { 
					         0x01 
					        }, 

					       "device_type", 
					        Buffer (0x09) 
					        { 
					           "ethernet" 
					        }, 
					           "name", 
					        Buffer () 
					        { 
					           "Realtek RTL8111/8168B PCI-E Gigabit"  
					        } 
					      }, Local0) 
					      DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) 
					      Return (Local0) 
					  } 
               } 

          