Firewire power conservation Hack.

It´s a nice idea to change all your firewire names on DSDT to apple´s ones, for example from FIWI to FRWR.



Locate Scope (_GPE), add this on the end.

Method (_L1A, 0, NotSerialized)  /* <-- Added for firewire  */
{
    Notify (\_SB.PCI0.PCIB.FRWR, 0x00)
    Notify (\_SB.PWRB, 0x02)
}


Locate your Firewire device (or create it with this code if it doesn´t exist)


                Device (FRWR) /*Add all this code if you don´t have firewire device on DSDT*/
                {
                    Name (_ADR, 0x00070000)
                    Name (_GPE, 0x1A)
                    Method (_DSM, 4, NotSerialized) /* Add from here if you already have a firewire device on dsdt*/
                    {
                        Store (Package (0x02)
                            {
                                "fwhub",
                                Buffer (0x04)
                                {
                                    0x00, 0x00, 0x00, 0x00
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }     /* End of code if you just add to a existing firewire device */
                }