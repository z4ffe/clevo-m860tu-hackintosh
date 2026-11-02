Not all control paths return a value



dsdt.dsl   255:             Method (_BTP, 1, NotSerialized)
Warning  2019 -              ^ Not all control paths return a value (_BTP)


Device (CMB0)
{
    Name (_HID, EisaId ("PNP0C0A"))
    Name (_UID, 0x01)
    Name (BATP, Ones)
    Name (_PCL, Package (0x01)
    {
        \_SB
    })
    ...
    ...
    ...
    Method (_BTP, 1, NotSerialized)
    {
        If (LEqual (\ECFL, Zero))
        {
            Return (0x0F)
        }
        Else
        {
            Store ("_SB.CMB0._BTP", Debug)
        }
    }
    ...
    ...
    ...
}

In this case, the solution consists on using the returned value of \ECFL and then add it in place of "Debug"



Change this line:

 Store ("_SB.CMB0._BTP", Debug)

to this:

 Store ("_SB.CMB0._BTP", 0x0F)



