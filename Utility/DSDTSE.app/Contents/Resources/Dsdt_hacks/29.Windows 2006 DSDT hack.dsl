Windows 2006 DSDT hack
This hack allows that specific resources be activated depending on the Operating system detected.
Many bios check if they are being run on some sort of Windows OS (mostly) to enable code. Some bioses have specific code for Linux, but none have specific code for OSX
so we must tell the bios that we use vista (which normally enables everything by default), disabling the check for the rest of the OS specifics.

Locate the (_SB) section with the code editor and search for these lines:

Scope (_SB) 
     { 
         Method (_INI, 0, NotSerialized) 
         { 
             If (DTSE) 
             { 
                 TRAP (0x47) 
             } 
  
             Store (0x07D0, OSYS)  //--------------- from this line forward, we comment the checks.
 //             If (CondRefOf (_OSI, Local0)) 
 //             { 
 //                 If (_OSI ("Linux")) 
 //                 { 
 //                     Store (0x03E8, OSYS) 
 //                 } 
 //                 Else 
 //                 { 
 //                     Store (0x07D1, OSYS) 
 //                     If (_OSI ("Windows 2001 SP2")) 
 //                     { 
 //                         Store (0x07D2, OSYS) 
 //                     } 
  
 //                     If (_OSI ("Windows 2001.1")) 
 //                     { 
 //                         Store (0x07D3, OSYS) 
 //                     } 
  
 //                     If (_OSI ("Windows 2001.1 SP1")) 
 //                     { 
 //                         Store (0x07D4, OSYS) 
 //                     } 
  
 //                     If (_OSI ("Windows 2006")) 
 //                     { 
 //                         Store (0x07D6, OSYS) 
 //                     } 
  
 //                     If (LAnd (MPEN, LEqual (OSYS, 0x07D1))) 
 //                     { 
 //                         TRAP (0x3D) 
 //                     } 
 //                 } 
 //             } 
          Store (0x07D6, OSYS)  //---------- In this line not commented, we tell the DSDT to always use Window Vista specifics
         }