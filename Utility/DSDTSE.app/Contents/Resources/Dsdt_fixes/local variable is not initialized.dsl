local variable is not initialized



./dsdt_ﬁxed.txt 408: Store (Local0, Local0) 
Error 4050 - ^ Method local variable is not initialized (Local0)

If we revise the code, and look at line 408 we find the following error:

Scope (\_SI) 
    { 
        Method (_MSG, 1, NotSerialized) 
        { 
            Store (Local0, Local0) 
        }
        Method (_SST, 1, NotSerialized) 
        { 
            Store (Local0, Local0) 
        } 
    } 

How do we know what in the DSDT.dsl needs fixing? If you search for "Store" in the menu, and look just below the error, you will see something like this:


Store (0xFF, RSR0) 
Store (0x80, PMC0) 

The first value of "Store" is a hexadecimal value, and the second, a variable. There is the error. In the code
(Local0,local0), it is supposed that the first value is a hexadecimal, not a variable. we could add 0x00 or also zero, in a format like this:


Scope (\_SI) 
    { 
        Method (_MSG, 1, NotSerialized) 
        { 
            Store (zero, Local0) 
        } 
        Method (_SST, 1, NotSerialized) 
        { 
            Store (zero, Local0) 
        } 
    } 

Here we have the fix for gigabytes that have a similar problem:

Scope (\_SI) 
    { 
        Method (_MSG, 1, NotSerialized) 
        { 
            Store ("Local0", Local0) 
        } 
        Method (_SST, 1, NotSerialized) 
        { 
            Store ("Local0", Local0) 
        } 
    } 

Note that Gigabyte puts Local0 in the quotes to fix the error. Then we should have initialized everything that the compiler asks us. 

