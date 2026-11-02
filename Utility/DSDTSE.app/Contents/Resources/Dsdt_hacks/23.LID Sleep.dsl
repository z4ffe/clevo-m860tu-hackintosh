LID Sleep.
Code to fix sleep when closing the lid of the laptop:




Device (LID)
{
Name (_HID, EisaId ("PNP0C0D"))      //LID device
Name (LIDS, One)
Method (_LID, 0, NotSerialized)
{
Store (^^PCI0.SBRG.EC0.SF13, LIDS) //LID register
XOr (LIDS, One, Local0)
IF (Local0)                                     //if LID is closed 
{ 
Notify (SLPB, 0x80)                         //Set system to sleep
} 
Return (LIDS)
}
