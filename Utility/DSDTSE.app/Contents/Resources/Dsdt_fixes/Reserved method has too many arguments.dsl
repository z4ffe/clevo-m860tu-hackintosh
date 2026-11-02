Reserved method has too many arguments



dsdt.dsl 906: Method (_OSC, 5, NotSerialized)
Warning 1075 - ^ Reserved method has too many arguments (_OSC requires 4)




Method (_OSC, 5, NotSerialized)
            {
                Store (Arg3, Local0)
                Multiply (Local0, 0x04, Local1)
                Name (BUF1, Buffer (Local1) {})
                Store (Arg4, BUF1)
                Store (Zero, Local1)
                Store (Zero, Local2)
                While (Local0)
                {
                    Multiply (Local1, 0x04, Local2)
                    CreateDWordField (BUF1, Local2, CAPB)
                    If (Arg2)
                    {
                        If (LEqual (Local1, Zero))
                        {
                            And (CAPB, 0xFFFFFFFC)
                        }
                    }
                    Else
                    {
                    }

                    Increment (Local1)
                    Decrement (Local0)
                }

                Return (BUF1)
            }

In this error you must change this:



Method (_OSC, 5, NotSerialized)

to this:

Method (_OSC, 4, NotSerialized)