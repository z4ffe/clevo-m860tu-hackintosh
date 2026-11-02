CPU ALIAS FIX.

This is maybe the easiest fix of all DSDT fixes, simply use the code browser using the CPU option and remove all the lines that say "alias"

Example:

BEFORE:

Scope (_PR)
{
    Processor (P001, 0x01, 0x00000810, 0x06) {}
    Processor (P002, 0x02, 0x00000000, 0x00) {}
    Alias (P002, CPU2)
    Processor (P003, 0x03, 0x00000000, 0x00) {}
    Processor (P004, 0x04, 0x00000000, 0x00) {}
    Alias (P004, CPU4)
    Processor (P005, 0x05, 0x00000000, 0x00) {}
    Processor (P006, 0x06, 0x00000000, 0x00) {}
    Alias (P006, CPU6)
    Processor (P007, 0x07, 0x00000000, 0x00) {}
    Processor (P008, 0x08, 0x00000000, 0x00) {}
    Alias (P008, CPU8)
}


After:

Scope (_PR)
{
    Processor (P001, 0x01, 0x00000810, 0x06) {}
    Processor (P002, 0x02, 0x00000000, 0x00) {}
    Processor (P003, 0x03, 0x00000000, 0x00) {}
    Processor (P004, 0x04, 0x00000000, 0x00) {}
    Processor (P005, 0x05, 0x00000000, 0x00) {}
    Processor (P006, 0x06, 0x00000000, 0x00) {}
    Processor (P007, 0x07, 0x00000000, 0x00) {}
    Processor (P008, 0x08, 0x00000000, 0x00) {}
}


