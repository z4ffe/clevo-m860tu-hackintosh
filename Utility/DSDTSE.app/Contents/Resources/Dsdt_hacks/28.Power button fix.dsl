If the power button does not activate the shutdown menu on the system, here is the fix:





Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Name (_UID, 0xAA)
            Name (_STA, 0x0B)
        }


Cambiar a:


		Device (PWRB)
		        {
		            Name (_CID, EisaId ("PNP0C0C"))
		            Name (_UID, 0xAA)
		            Name (_STA, 0x0B)
		        }

