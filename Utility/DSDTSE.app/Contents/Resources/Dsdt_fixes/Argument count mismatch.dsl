Argument count mismatch error



./dsdt_ﬁxed.txt     1: ACPI (Local2) 
Error    4095 -            ^ syntax error, unexpected PARSEOP_NAMESEG, expecting PARSEOP_DEFINITIONBLOCK 



This error comes from line 1

If we look inside the DSDT.dsl, we can verify that the error is here:



ACPI Error (dmutils-0261): Argument count mismatch for method \_SB_.VWAK 3 1 [20080926] 
ACPI Error (dmutils-0261): Argument count mismatch for method \_GPE.VBRE 2 1 [20080926] 
/* 
 * Intel ACPI Component Architecture 
 * AML Disassembler version 20080926 


There should be no code after these lines:


/* 
 * Intel ACPI Component Architecture 
 * AML Disassembler version 20080926 

By simply erasing those two lines, you should be able to try and compile again, and see if it generates a new error.
