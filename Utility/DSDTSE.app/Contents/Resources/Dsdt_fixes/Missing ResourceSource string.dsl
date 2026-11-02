Missing ResourceSource string




dsdt.asl  1028:                     0x0100, 0x00)
Error    1094 -                      ^ Missing ResourceSource string (required)

dsdt.asl  1034:                     0x00000CF8, 0x00)
Error    1094 -                     ^ Missing ResourceSource string (required)

dsdt.asl  1041:                     0x0000F300, 0x00)
Error    1094 -                     ^ Missing ResourceSource string (required)

To fix this error we must eliminate the value of 0x00 from all erroneous entries:

Before:

1023  WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
1024      0x0000, /* Address Space Granularity */
1025      0x0000, /* Address Range Minimum */
1026      0x00FF, /* Address Range Maximum */
1027      0x0000, /* Address Translation Offset */
1028      0x0100, 0x00)

After:

1023  WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
1024      0x0000, /* Address Space Granularity */
1025      0x0000, /* Address Range Minimum */
1026      0x00FF, /* Address Range Maximum */
1027      0x0000, /* Address Translation Offset */
1028      0x0100)

Search for all the lines and repair them