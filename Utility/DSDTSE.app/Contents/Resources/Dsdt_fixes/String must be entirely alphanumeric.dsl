String must be entirely alphanumeric



dsdt.dsl    32:             Name (_HID, "*PNP0A03")
Error    1068 -     ^ String must be entirely alphanumeric (*PNP0A03)

Solution:

Remove the "*" character

(*PNP0A03)
 
Converts to:

(PNP0A03)
