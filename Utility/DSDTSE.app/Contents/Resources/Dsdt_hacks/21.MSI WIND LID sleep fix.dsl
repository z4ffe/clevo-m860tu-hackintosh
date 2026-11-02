MSI WIND LID sleep fix

This code fixes sleep in the MSI laptops when you close the lid


Original Code:


Device (LID0)
{
Name (_HID, EisaId ("PNP0C0D"))
Method (_LID, 0, NotSerialized)
{
If (MYEC)
{
Store (LIDS, Local0)
}
Else
{
Store (One, Local0)
}

Return (Local0)
}
}

Method (_Q80, 0, NotSerialized)


It must be changed to: -----------------------------------



Device (LID0)
{
Name (_HID, EisaId ("PNP0C0D"))
Method (_LID, 0, NotSerialized)
{
XOr (LIDS, One, Local0)
If (Local0)
{
Notify (SLPB, 0x80)
}

Return (LIDS)
}
}

Method (_Q80, 0, NotSerialized)


