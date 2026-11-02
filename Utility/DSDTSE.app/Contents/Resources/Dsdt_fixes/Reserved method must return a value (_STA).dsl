Reserved method must return a value (_STA)

This is the error:


                                 Method (_STA, 0, NotSerialized) 
Warning  2026 -                ^ Reserved method must return a value
(_STA) 


This is the original code:



Method (_STA, 0, NotSerialized) 
            { 
                STAL (0x60) 
            } 


It should read:



            Method (_STA, 0, NotSerialized) 
            { 
                Return (STAL (0x60)) 
            } 
