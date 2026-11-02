Snow Leopard Cmos hack.

The corruption of the bios is caused by an excessive value in the RTC that causes memory conflicts with other drivers.

Device (RTC)
{
  Name (_HID, EisaId ("PNP0B00"))
  Name (_CRS, ResourceTemplate ()
  {
     IO (Decode16,
     0x0070,             // Range Minimum
     0x0070,             // Range Maximum
     0x00,               // Alignment
     0x04,               // Length     <----------------   The 0x04 value causes corruption in the bios using Snow Leopard.
     )
   })
}

So we change the code to this:


Device (RTC)
{
  Name (_HID, EisaId ("PNP0B00"))
  Name (_CRS, ResourceTemplate ()
  {
     IO (Decode16,
     0x0070,             // Range Minimum
     0x0070,             // Range Maximum
     0x00,               // Alignment
     0x02,               // Length    <----------------   The 0x04 Value corrected to 0x02 to avoid the corruption of the CMOS.
     )
   })
}