Cpu temp cool hack by 67GTA on Ubuntu forums.


This hack changes the way that tempreture is read by the system.
If you have this code in your DSDT, the meaning is the following:

If your OS is Windows Vista or earlier, then report that the temperature is readable by the system.
else report that the temperature is not readable, creating an increase in temperature and incorrect functioning of the CPU fans

Search for these sections in your DSDT, and comment (//) the lines suggested to eliminate this check completely.


       
Before:

    Method (_HOT, 0, Serialized)
   {
       If (LEqual (OSYS, 0x07D6))
     {
       Return (Add (0x0AAC, Multiply (TPC, 0x0A)))
     }
   }

   Method (_CRT, 0, Serialized)
   {
     If (LLess (OSYS, 0x07D6))
     {
      Return (Add (0x0AAC, Multiply (TPC, 0x0A)))
     }
    }



After:




        Method (_HOT, 0, Serialized)
       {
    // If (LEqual (OSYS, 0x07D6))
      // {
           Return (Add (0x0AAC, Multiply (TPC, 0x0A)))
       // }
       }

       Method (_CRT, 0, Serialized)
       {
     //If (LLess (OSYS, 0x07D6))
        // {
          Return (Add (0x0AAC, Multiply (TPC, 0x0A)))
        // }
        }
