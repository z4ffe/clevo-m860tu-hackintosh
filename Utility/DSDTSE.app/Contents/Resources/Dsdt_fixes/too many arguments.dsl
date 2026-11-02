too many arguments



dsdt.dsl  2672:        Method (_GLK, 1, NotSerialized)
Warning  2024 -       ^ Reserved method has too many arguments ( _GLK requires 0)

Solution: eliminate the arguments:

Method (_GLK)

this was a simple one :)