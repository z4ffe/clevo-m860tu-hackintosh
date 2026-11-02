Access width of Field Unit extends beyond region limit



SRST, 1,
Error 1051 - ^ Access width of Field Unit extends beyond region limit
ACPW, 1
Error 1051 - ^ Access width of Field Unit extends beyond region limit

This error consists on that the limit of data is less that the quantity of the same




OperationRegion (GPIO, SystemIO, 0x1180, 0x3B)   <---------- "0x3B" contains the error, it must be increased for example to "0x3C"  (hexa)

Field (GPIO, WordAcc, Lock, Preserve)
{
AccessAs (DWordAcc, 0x00),
Offset (0x0F),
, 4,
LV28, 1,
Offset (0x2D),
, 5,
LPOL, 1,
Offset (0x38),
, 1,
SRST, 1,
Offset (0x39),
, 2,
ACPW, 1
}

We can use a decimal - hexadecimal converter to try new values until we find the correct one that the compiler likes


