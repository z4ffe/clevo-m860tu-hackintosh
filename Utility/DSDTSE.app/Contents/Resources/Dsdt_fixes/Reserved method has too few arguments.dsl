Reserved method has too few arguments




dsdt.dsl  3067:     Method (_EJ0, 0, NotSerialized)
Warning  1076 -     ^ Reserved method has too few arguments (_EJ0 requires 1)

This error is solved by changing:

Method (_EJ0, 0, NotSerialized)

to:


Method (_EJ0, 1, NotSerialized)

