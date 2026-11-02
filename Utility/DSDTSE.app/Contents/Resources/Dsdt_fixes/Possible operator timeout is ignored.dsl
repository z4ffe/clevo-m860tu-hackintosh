Possible operator timeout is ignored


dsdt.dsl  4220:             Acquire (MUTE, 0x03E8)
Warning  1103 -              ^ Possible operator timeout is ignored

dsdt.dsl  4234:             Acquire (MUTE, 0x03E8)
Warning  1103 -              ^ Possible operator timeout is ignored

dsdt.dsl  4249:             Acquire (MUTE, 0x03E8)
Warning  1103 -              ^ Possible operator timeout is ignored

dsdt.dsl  4264:             Acquire (MUTE, 0x0FFF)
Warning  1103 -              ^ Possible operator timeout is ignored

dsdt.dsl  4278:             Acquire (MUTE, 0x03E8)
Warning  1103 -               ^ Possible operator timeout is ignored

dsdt.dsl  4293:             Acquire (MUTE, 0x03E8)
Warning  1103 -               ^ Possible operator timeout is ignored

dsdt.dsl  4308:             Acquire (MUTE, 0x03E8)
Warning  1103 -               ^ Possible operator timeout is ignored


In this error, the value of MUTE must be changed from 0xXXXX to 0xFFFF

Acquire (MUTE, 0x03E8)

Converts to: 

Acquire (MUTE, 0xFFFF)

it must be replaced where ever it gives error.