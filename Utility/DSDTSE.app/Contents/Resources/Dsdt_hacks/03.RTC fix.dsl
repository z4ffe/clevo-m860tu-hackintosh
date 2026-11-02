RTC fix.

Consists in eliminating all the IRQs from RTC.
Has been reported that erasing IRQ from RTC breaks sleep under snow leopard 10.6.0 and 10.6.1, on 10.6.2 doesn´t breaks sleep.



original code:

Device (RTC)
{
    Name (_HID, EisaId ("PNP0B00"))
    Name (_CRS, ResourceTemplate ()
    {
        IO (Decode16,
            0x0070,             // Range Minimum
            0x0070,             // Range Maximum
            0x01,               // Alignment
            0x08,               // Length
            )
        IRQNoFlags ()
            {8}
    })
}


Clean Code:




Device (RTC)
{
    Name (_HID, EisaId ("PNP0B00"))
    Name (_CRS, ResourceTemplate ()
    {
        IO (Decode16,
            0x0070,             // Range Minimum
            0x0070,             // Range Maximum
            0x01,               // Alignment
            0x08,               // Length
            )
    })
}

There must be no IRQ code left in RTC
