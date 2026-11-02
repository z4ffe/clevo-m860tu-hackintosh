must return a value (_WAK)


dsdt.dsl   163:     Method (_WAK, 1, NotSerialized)
Warning  2026 -                ^ Reserved method must return a value (_WAK)

At the end of the _WAK method, this must be added:

Return(Package(0x02){Zero, Zero})


Example:


Method (_WAK, 1, NotSerialized)
    {
        P8XH (One, 0xAB)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LEqual (OSYS, 0x07D1)))
                {
                    TRAP (0x3D)
                }
            }
        }

        If (LEqual (RP2D, Zero))
        {
            Notify (\_SB.PCI0.RP02, Zero)
        }

        If (LEqual (Arg0, 0x03)) {}
        If (LEqual (Arg0, 0x04))
        {
            \_SB.PCI0.LPCB.EC.SELE ()
        }

        P8XH (Zero, 0xCD)

        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }



