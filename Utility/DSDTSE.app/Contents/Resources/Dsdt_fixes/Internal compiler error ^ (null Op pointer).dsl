Internal compiler error ^ (null Op pointer)




dsdt.dsl 4106: If (LNot (\_OSI ("Windows 2006")))
Error 4011 - Internal compiler error ^ (null Op pointer)

The incorrect part of the code is:


If (LNot (\_OSI ("Windows 2006")))
{
PHSR (0x10, 0x00)
}



It can be fixed by these changes:



If (\_OSI ("Windows 2006"))
   {
      }
        Else
      {
      PHSR (0x10, 0x00)
   }