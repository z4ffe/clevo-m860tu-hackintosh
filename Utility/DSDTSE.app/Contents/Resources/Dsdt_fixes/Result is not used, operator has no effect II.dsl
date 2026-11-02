 Result is not used, operator has no effect ^  


dsdt.dsl 10150:                                         ShiftRight (BUF2, 0x04)
Warning  1105 -             Result is not used, operator has no effect ^

The error is produced because "Shiftright" stores no value:

.....
   Store (AAXB, MBUF)
   ShiftRight (BUF2, 0x04) <------- error.
   Store (BUF2, Local3)
   Store (CMER, BUF0)
   Store (0xFF, BUF1)
   Store (Zero, BUF2)
.....

it must be changed to this :

Store (BUF2, Local4)

                                    
    Store (AAXB, MBUF)
    Store (BUF2, Local4)   <-----------  Here.
    Store (BUF2, Local3)
    Store (CMER, BUF0)
    Store (0xFF, BUF1)
    Store (Zero, BUF2)



