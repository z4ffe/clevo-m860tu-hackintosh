ASUS EEEPC 1000H Lid sleep fix

Code to fix sleep when closing the lid of the laptop.

Device (LID0)
{
Name (_HID, EisaId ("PNP0C0D")) //LID detection
Method (_PRW, 0, NotSerialized)
{
Return (Package (0x02)
{
0x0B,
0x04
})
}
Name (LIDS, One)
Method (_LID, 0, NotSerialized)
{
Store (^^PCI0.SBRG.EC0.SF13, LIDS) //LID register
XOr (LIDS, One, Local0)
IF (Local0) //if LID is closed
{
Notify (SLPB, 0x80) //Set system to sleep
}
Return (LIDS)
}