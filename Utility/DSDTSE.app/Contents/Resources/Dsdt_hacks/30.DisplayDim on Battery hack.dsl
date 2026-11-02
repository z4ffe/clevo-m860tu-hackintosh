If you want the screen of the laptop to be less iluminated when you use the battery, do the following:

Delete the IRQ from the TMR section

         Device (TIMR)
          {
              Name (_HID, EisaId ("PNP0100"))
              /*  IRQNoFlags ()
                      {2}    */


and add it to the IPC section:

Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()  /*  <------------------------- added */
                            {2}