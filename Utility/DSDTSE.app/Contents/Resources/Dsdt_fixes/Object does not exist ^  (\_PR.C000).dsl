Object does not exist ^  (\_PR.C000)

In this error, there is missing code that needs to be added to the beginning.


dsdt.dsl    75:              If (LEqual (\C001, 0x00))
Error    1061 -       Object does not exist ^  (\C001)
 
dsdt.dsl  6589:                 \_PR.C000
Error    1061 -   Object does not exist ^  (\_PR.C000)
 
dsdt.dsl  6645:         Notify (\_PR.C000, 0x80)
Error    1061 -   Object does not exist ^  (\_PR.C000)
 
dsdt.dsl  6718:         Notify (\_PR.C000, 0x80)
Error    1061 -   Object does not exist ^  (\_PR.C000)

This is the code to be added:

 
External (\C001)                 
External (\_PR.C000)


Just below the header of the DSDT, like this:


/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20090625
 *
 * Disassembly of ./dsdt.dat, Tue Aug 11 23:29:06 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005FC3 (24515)
 *     Revision         0x02
 *     Checksum         0x13
 *     OEM ID           "Sony"
 *     OEM Table ID     "VAIO"
 *     OEM Revision     0x20080725 (537397029)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20090625 (537462309)
 */
DefinitionBlock ("./dsdt.aml", "DSDT", 2, "Sony", "VAIO", 0x20080725)
{

    External (\C001)                 
	External (\_PR.C000)


    External (L0C3)
    External (L1C3)
    External (PDC1)
    External (PDC0)
    External (CFGD)
