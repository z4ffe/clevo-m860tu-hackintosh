Warning  1099 -Unknown reserved name ^  (_BCG)

On this case the compiler is complaining about the use of "-" on a specified method name.

Example:

Method (_BCG, 0, Serialized)
                    {
                        Store (C136, Local0)
                        Return (Local0)
                    }
                }

Just change _BCG to BCG and the compiler will be happy again.

Method (BCG, 0, Serialized)
                    {
                        Store (C136, Local0)
                        Return (Local0)
                    }
                }