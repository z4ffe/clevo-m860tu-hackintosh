HPET FIX

This fix allows us to load the driver Appleintelcpupowermanagement.kext, and in that way have the option to use the native speedstep available in osx

This is the HPET code from a Mac:


Device (HPET)
               {
                   Name (_HID, EisaId ("PNP0103"))
                   Name (BUF0, ResourceTemplate ()
                   {
                       IRQNoFlags ()
                           {0}
                       IRQNoFlags ()
                           {8}
                       Memory32Fixed (ReadOnly,
                           0xFED00000,         // Address Base
                           0x00000400,         // Address Length
                           _Y09)
                   })
            

This is the HPET code from a PC:


Device (HPET)
{
    Name (_HID, EisaId ("PNP0103"))
    Name (_CID, EisaId ("PNP0C01"))
    Name (BUF0, ResourceTemplate ()
    {
        Memory32Fixed (ReadOnly,
            0xFED00000,         // Address Base
            0x00000400,         // Address Length
            _Y0F)
    })
  
We only have to add the "Irqnoflags" and that would fix it.

   IRQNoFlags ()
       {0}
   IRQNoFlags ()
       {8}


After adding "Irqnoflags", here is what it would look like on your DSDT:


Device (HPET)
{
    Name (_HID, EisaId ("PNP0103"))
    Name (_CID, EisaId ("PNP0C01"))
    Name (BUF0, ResourceTemplate ()
    {
       IRQNoFlags ()
          {0}
       IRQNoFlags ()
          {8}
        Memory32Fixed (ReadOnly,
            0xFED00000,         // Address Base
            0x00000400,         // Address Length
            _Y0F)
    })