This method must be included in the DSDT (In any location, preferably right after the Headers, so the hacks of video audio, net etc work)

Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44, 
                    /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                            0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                0x00
            }, Arg4)
        Return (Zero)
    }



Example:

(Do not copy this example to your code, this is only an example)





//<----------------Begin DSDT Header----------------->

/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20090625
 *
 * Disassembly of ./dsdt.dat, Tue Aug 11 22:15:09 2009
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

{       <-------------------Primer corchete del código DSDT.

// <-----------------------------Inicio método DTGP

Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44, 
                    /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                            0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                0x00
            }, Arg4)
        Return (Zero)
    }

//<----------------End of DTGP Method-------------------->

//-------------------Rest of the DSDT Code-----------------
    External (L0C3)
    External (L1C3)
    External (PDC1)
    External (PDC0)
    External (CFGD)

    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x08), 
        TRP0,   8
    }
.....
.....