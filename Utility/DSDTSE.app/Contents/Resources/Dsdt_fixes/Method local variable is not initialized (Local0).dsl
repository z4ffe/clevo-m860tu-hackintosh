Method local variable is not initialized (Local0)




DSDT.dsl 242: Store (Local0, Local0)
Error 4050 – ^ Method local variable is not initialized (Local0)

This error is produced because a variable tries to store it's value in itself.



Original:



  Scope (\_SI)
  {
   Method (_MSG, 1, NotSerialized)
   {
    Store (Local0, Local0)
   }

   Method (_SST, 1, NotSerialized)
   {
    Store (Local0, Local0)
    If (LEqual (Arg0, 0x03)) {}
    If (LEqual (Arg0, 0x01)) {}
   }
  }


Repaired:



   Scope (\_SI)
   {
    Method (_MSG, 1, NotSerialized)
    {
 /* Store (Local0, Local0) */      /* <------------ you need to comment this out or enclose on "" the first LOCAL0.*/ 
    }

    Method (_SST, 1, NotSerialized)
    {
 /* Store (Local0, Local0) */       /* <------------ you need to comment this out or enclose on "" the first LOCAL0..*/ 
    If (LEqual (Arg0, 0x03)) {}
    If (LEqual (Arg0, 0x01)) {}
    }
   }

Local0 enclosed with "" :

 Scope (\_SI)
  {
   Method (_MSG, 1, NotSerialized)
   {
/* Store ("Local0", Local0) */      /* <------------ you need to comment this out or enclose on "" the first LOCAL0.*/ 
   }

   Method (_SST, 1, NotSerialized)
   {
/* Store ("Local0", Local0) */       /* <------------ you need to comment this out or enclose on "" the first LOCAL0..*/ 
   If (LEqual (Arg0, 0x03)) {}
   If (LEqual (Arg0, 0x01)) {}
   }
  }
