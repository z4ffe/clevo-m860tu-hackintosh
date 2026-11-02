Use of reserved word ^  (_T_0)
In this error:

dsdt.dsl  2928:                             Name (_T_0, Zero)
Error    4081 -                 Use of reserved word ^  (_T_0)

dsdt.dsl  2980:                                                         Name (_T_1, "")
Error    4081 -                                             Use of reserved word ^  (_T_1)

dsdt.dsl  3012:                             Name (_T_2, Zero)
Error    4081 -                 Use of reserved word ^  (_T_2)

dsdt.dsl  3039:                         Name (_T_0, Zero)
Error    4081 -             Use of reserved word ^  (_T_0)

dsdt.dsl  3215:                             Name (_T_0, Zero)
Error    4081 -                 Use of reserved word ^  (_T_0)

dsdt.dsl  3404:                             Name (_T_1, Zero)
Error    4081 -                 Use of reserved word ^  (_T_1)



The solution consists of changing this:

Name (_T_0, Zero)

to this:

Name (T_0, Zero)

