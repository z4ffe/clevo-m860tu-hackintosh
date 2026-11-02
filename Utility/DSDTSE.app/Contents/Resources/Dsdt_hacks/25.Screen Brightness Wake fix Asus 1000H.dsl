Screen Brightness Wake fix Asus 1000H

If you have this model, here is the fix for brightness after waking up from sleep.




Method (WAK, 1, NotSerialized) //WAKE up
{
\_SB.PCI0.SBRG.EC0.EC0W (Arg0)
\_SB.PCI0.NWAK (Arg0)
\_SB.PCI0.SBRG.SWAK (Arg0)
LPWK (Arg0)
\_SB.ATKD.PBLS(\_SB.ATKD.PBLG())       // Brightness fix
}
