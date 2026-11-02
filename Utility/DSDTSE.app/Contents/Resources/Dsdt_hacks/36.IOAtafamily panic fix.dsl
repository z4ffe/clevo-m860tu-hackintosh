IOAtafamily panic fix (Only fon Intel PATA controller)


Locate PATA on DSDT (0x001F0001 adress) and add this code:

OperationRegion (IDET, PCI_Config, 0x40, 0x04) // IDE Timing Register
Field (IDET, WordAcc, NoLock, Preserve)
   {
     Offset (0x00),
     M1, 8,
     Offset (0x01),
     M2, 8,
     Offset (0x02),
     M3, 8,
     Offset (0x03),
     M4, 8
   }

     Method (_DSM, 4, NotSerialized)
   {
     Store (0x07, M1)
     Store (0xE3, M2)
     Store (Zero, M3)
     Store (0xC0, M4)
     Return (Zero)
   }

To keep the functionality after sleep and wake:

Locate _wak method and add this:

   Method (_WAK, 1, NotSerialized)
  {
    \_SB.PCI0.PATA._INI ()


Your _wak method has to end like this:
..............................
    Return (Package (0x02)
    {
     Zero,
     Zero
    })
  }




Another fix  (Apply the same as the one before):

    OperationRegion (IDET, PCI_Config, 0x40, 0x04)
    Field (IDET, WordAcc, NoLock, Preserve)
    {
     M1, 16,
     M2, 16
    }

    Method (_INI, 0, NotSerialized)
    {
    Store (0xE307, M1)
    Store (0xC000, M2)
    }



This is the fix applied to a SATA controller on Laptop:


          Device (SATA)
          {
              Name (_ADR, 0x001F0002)
              OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
              Field (SACS, DWordAcc, NoLock, Preserve)
              {
                  PRIT,   16,
                  SECT,   16,
                  PSIT,   4,
                  SSIT,   4,
                          Offset (0x08),
                  SYNC,   4,
                          Offset (0x0A),
                  SDT0,   2,
                      ,   2,
                  SDT1,   2,
                          Offset (0x0B),
                  SDT2,   2,
                      ,   2,
                  SDT3,   2,
                          Offset (0x14),
                  ICR0,   4,
                  ICR1,   4,
                  ICR2,   4,
                  ICR3,   4,
                  ICR4,   4,
                  ICR5,   4,
                          Offset (0x50),
                  MAPV,   2
              }

              /* #define   IDE_DECODE_ENABLE    (1 << 15)
               * #define   IDE_SITRE        (1 << 14)
               *
               * #define   IDE_ISP_5_CLOCKS    (0 << 12)
               * #define   IDE_ISP_4_CLOCKS    (1 << 12)
               * #define   IDE_ISP_3_CLOCKS    (2 << 12)
               *
               * #define   IDE_RCT_4_CLOCKS    (0 <<  8)
               * #define   IDE_RCT_3_CLOCKS    (1 <<  8)
               * #define   IDE_RCT_2_CLOCKS    (2 <<  8)
               * #define   IDE_RCT_1_CLOCKS    (3 <<  8)
               *
               * #define   IDE_DTE1        (1 <<  7)
               * #define   IDE_PPE1        (1 <<  6)
               * #define   IDE_IE1        (1 <<  5)
               * #define   IDE_TIME1        (1 <<  4)
               * #define   IDE_DTE0        (1 <<  3)
               * #define   IDE_PPE0        (1 <<  2)
               * #define   IDE_IE0        (1 <<  1)
               * #define   IDE_TIME0        (1 <<  0)
               * ---------------------------------------
               * SATA controller in plain mode
               *          1111 1100 0000 0000
               *          5432 1098 7654 3210
               * 0xE307 = 1110 0011 0000 0111 = IDE_TIME0 | IDE_IE0 | IDE_PPE0 |
               * IDE_RCT_1_CLOCKS | IDE_ISP_3_CLOCKS | IDE_SITRE | IDE_DECODE_ENABLE
               *
               * 0xC000 = 1100 0000 0000 0000 = IDE_SITRE | IDE_DECODE_ENABLE
               */

              Method (_INI, 0, NotSerialized)
              {
                  Store (0xE307, PRIT)
                  Store (0xC000, SECT)
              }
          }
