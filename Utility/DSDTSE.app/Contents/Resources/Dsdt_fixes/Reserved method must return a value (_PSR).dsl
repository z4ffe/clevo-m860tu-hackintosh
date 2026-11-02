Reserved method must return a value (_PSR)



dsdt.dsl 3896: Method (_PSR, 0, NotSerialized)
Warning 1079 - ^ Reserved method must return a value (_PSR)

Here the problem is that it is not detected the change from battery/AC

Extracted from the ACPI specifications:

11.3.1 PSR (Power Source)
Returns the current power source devices. Used for the AC adapter and is located under the AC adapter
object in name space. Used to determine if system is running off the AC adapter.
Arguments:
None
Result Code:
0x00000000 – Off-line
0x00000001 – On-line


This is the erroneous code:


Method (_PSR, 0, NotSerialized)
            {
                If (\_SB.PCI0.PIB.EC.ECOK)
                {
                    Return (\_SB.PCI0.PIB.EC.ADP)
                }
            }


And here the solution:


Method (_PSR, 0, NotSerialized)
{
    If (\_SB.PCI0.PIB.EC.ECOK)
    {
        Return (0x01)
    }
    Else
    {
        Return (0x00)
    }
}



