Result is not used, operator has no effect


The warning:

./dsdt.dsl  2803:       And (CTRL, 0x1E)
Warning  1105 -         ^ Result is not used, operator has no effect

It can be fixed changing:

And (CTRL, 0x1E)

to:

And (CTRL, 0x1E, CTRL)