Device Removal error (USB) fix

It can be fixed by adding these entries to USB:

Notify (\_SB.PWRB, 0x02)



Use the search feature to locate:


Scope (\_GPE) 

You will find something similar to:



Scope (\_GPE)
{
Method (_L09, 0, NotSerialized)
{
Notify (\_SB.PCI0.P0P2, 0x02)
Notify (\_SB.PCI0.P0P2.PEGP, 0x02)
Notify (\_SB.PCI0.P0P4, 0x02)
Notify (\_SB.PCI0.P0P5, 0x02)
Notify (\_SB.PCI0.P0P6, 0x02)
Notify (\_SB.PCI0.P0P7, 0x02)
Notify (\_SB.PCI0.P0P8, 0x02)
Notify (\_SB.PCI0.P0P9, 0x02)
}

Method (_L03, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB0, 0x02)
}

Method (_L04, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB1, 0x02)
}

Method (_L0C, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB2, 0x02)
}

Method (_L0E, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB3, 0x02)
}

Method (_L0D, 0, NotSerialized)
{
Notify (\_SB.PCI0.EHCI, 0x02)
}

Method (_L05, 0, NotSerialized)
{
Notify (\_SB.PCI0.MC97, 0x02)
}

Method (_L0B, 0, NotSerialized)
{
Notify (\_SB.PCI0.P0P1, 0x02)
}
}
}

The code must be added this way:      --------------------------------------------


Scope (\_GPE)
{
Method (_L09, 0, NotSerialized)
{
Notify (\_SB.PCI0.P0P2, 0x02)
Notify (\_SB.PCI0.P0P2.PEGP, 0x02)
Notify (\_SB.PCI0.P0P4, 0x02)
Notify (\_SB.PCI0.P0P5, 0x02)
Notify (\_SB.PCI0.P0P6, 0x02)
Notify (\_SB.PCI0.P0P7, 0x02)
Notify (\_SB.PCI0.P0P8, 0x02)
Notify (\_SB.PCI0.P0P9, 0x02)
}

Method (_L03, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB0, 0x02)
Notify (\_SB.PWRB, 0x02)      */ <---- added/*
}

Method (_L04, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB1, 0x02)
Notify (\_SB.PWRB, 0x02)   */ <---- added/*
}

Method (_L0C, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB2, 0x02)
Notify (\_SB.PWRB, 0x02)  */ <---- added/*
}

Method (_L0E, 0, NotSerialized)
{
Notify (\_SB.PCI0.USB3, 0x02)
Notify (\_SB.PWRB, 0x02)   */ <---- added/*
}

Method (_L0D, 0, NotSerialized)
{
Notify (\_SB.PCI0.EHCI, 0x02)
}

Method (_L05, 0, NotSerialized)
{
Notify (\_SB.PCI0.MC97, 0x02)
}

Method (_L0B, 0, NotSerialized)
{
Notify (\_SB.PCI0.P0P1, 0x02)
}
}
}

