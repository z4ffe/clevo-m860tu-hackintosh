Not all control paths return a value

dsdt.dsl  7288:             Method (EVNT, 1, NotSerialized)
Warning  1086 -                        ^ Not all control paths return a value (EVNT)

In this other case, a value of this kind must be returned at the end of the method:


Return (Zero)


Example:



Method (EVNT, 1, NotSerialized)
            {
                While (VZOK)
                {
                    If (LEqual (VZOK, 0x01))
                    {
                        Store (Arg0, VZOK)
                        Notify (\_SB.VALZ, 0x80)
                        Return (Zero)
                    }
                    Else
                    {
                        Sleep (0x05)
                    }
                }
           }


The fix is something like:



Method (EVNT, 1, NotSerialized)
            {
                While (VZOK)
                {
                    If (LEqual (VZOK, 0x01))
                    {
                        Store (Arg0, VZOK)
                        Notify (\_SB.VALZ, 0x80)
                        Return (Zero)
                    }
                    Else
                    {
                        Sleep (0x05)
                    }
                }
				Return (Zero)
           }





