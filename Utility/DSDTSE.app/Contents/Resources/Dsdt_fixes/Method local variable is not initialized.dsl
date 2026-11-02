Method local variable is not initialized


dsdt.dsl   610:      If (LNot (LEqual (ShiftRight (And (Local1, 0x10), 0x03), And (Local2, 0x02))))
Error    1013 -      Method local variable is not initialized ^  (Local1)


In this case, you must change all "Local1" in that line to "Local2"
(Only in this case, in others it could be another error.)

