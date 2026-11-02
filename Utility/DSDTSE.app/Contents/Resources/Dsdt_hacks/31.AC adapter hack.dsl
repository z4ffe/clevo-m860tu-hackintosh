If the apadter/batery is not correctly recognized for your machine, check the ADP1 section and look if you have the following lines:

Device (ADP1)
 {
     Name (_HID, "ACPI0003")
     Name (_PRW, Package (0x02)  /*<---------------- Add these lines if they are not there */
     {
         0x18,
         0x03
     })                         /*<---------------- Add these lines if they are not there */