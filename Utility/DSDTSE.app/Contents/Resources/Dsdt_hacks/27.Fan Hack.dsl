FAN hack

On some machines, the fan settings are incorrect.
Here we examine why on this machine (Fujitsu Siemens Amilo Pro 2030):


Device (FAN)
                {
                    Name (_HID, EisaId ("PNP0C0B"))
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {     <----------------------------- This control method is empty.
                    }

                    Method (_PS3, 0, NotSerialized)
                    {      <----------------------------- This one too.
                    }
                }

The solution consists of adding extra code and filling the empty spaces in the methods with the correct "State" information.



                    Method (_PS0, 0, NotSerialized)
                    {
                       \_TZ.PFAN._ON ()
                       SFAN(0x03)
                    }
         
                    Method (_PS1, 0, NotSerialized)
                    {
                        SFAN (0x01)
                    }
         
                    Method (_PS2, 0, NotSerialized)
                    {
                        SFAN (0x02)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        \_TZ.PFAN._OFF ()
                    }



That way, the FAN (Ventilador) would end up this way:


Device (FAN)
                {
                    Name (_HID, EisaId ("PNP0C0B"))
                    Name (_PSC, 0x00)
					Method (_PS0, 0, NotSerialized)
                    {
                       \_TZ.PFAN._ON ()
                       SFAN(0x03)
                    }
         
                    Method (_PS1, 0, NotSerialized)
                    {
                        SFAN (0x01)
                    }
         
                    Method (_PS2, 0, NotSerialized)
                    {
                        SFAN (0x02)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        \_TZ.PFAN._OFF ()
                    }


