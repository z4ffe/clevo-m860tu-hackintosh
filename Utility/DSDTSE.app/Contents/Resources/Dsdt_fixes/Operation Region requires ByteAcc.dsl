Operation Region requires ByteAcc




./dsdt_ﬁxed.txt  3964:      Field (ECRM, AnyAcc, Lock, Preserve) 
Error    4075 -              ^ Host Operation Region requires ByteAcc access 

./dsdt_ﬁxed.txt  4192:      Return (Local1) 
Error    4050 -     Method local variable is not initialized ^  (Local1) 

What is happening here? Well This:

OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF) 
                    Field (ECRM, AnyAcc, Lock, Preserve) 

The compiler tells us that Anyacc isn't correct, it must be ByteAcc, so that way we change this:

OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF) 
                    Field (ECRM, ByteAcc, Lock, Preserve) 


The second error:


./dsdt_ﬁxed.txt  4192:      Return (Local1) 
Error    4050 -     Method local variable is not initialized ^  (Local1) 

Is similar to the error above, of the uninitialized variable, does it sound familiar to you all?

Method (PKTW, 1, NotSerialized) 
                    { 
                        Store (Arg0, EPKT) 
                        Return (Local1) 
We fix it like this: 


Method (PKTW, 1, NotSerialized) 
                    { 
                        Store (Arg0, EPKT) 
                        Return (Zero) 
