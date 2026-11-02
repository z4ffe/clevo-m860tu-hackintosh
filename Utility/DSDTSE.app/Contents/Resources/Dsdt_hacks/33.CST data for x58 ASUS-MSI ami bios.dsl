CST data HACK for AMI,MSI & ASUS

(EN)
This is the correct CST information for x58 MSI and ASUS motherboards using AMI bios and i7 processors.

(ES)
Esta es la información correcta CST para las placas x58 MSI y ASUS usando AMI bios y procesador i7.



/* Hack code start/ Inicio del hack */
/* Add this code on the beginning of the DSDT (after DSDT header)*/ 
/* Añadid este código al principio del DSDT (Justo despues de la cabecera del DSDT) */

    External (PDC7)
    External (PDC6)
    External (PDC5)
    External (PDC4)
    External (PDC3)
    External (PDC2)
    External (PDC1)
    External (CFGD)
    External (PDC0)
    External (NCPU)  /* This is the important data for i7  / Esta es la información importante para el i7 */


/* Add this code on the DSDT´s ending (before last  "}" bracket ) */
*/ Añadid este código al final del  DSDT, justo antes del último corchete "}" de Cierre) */
 
 Scope (_PR.P001)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (LGreater (NCPU, One), LNot (And (PDC0, 0x10))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            If (LAnd (And (CFGD, 0x00200000), And (PDC0, 0x0200)))
            {
                If (And (CFGD, 0x80))
                {
                    Return (Package (0x05)
                    {
                        0x04, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000000, // Address
                                    0x01,               // Access Size
                                    )
                            }, 

                            One, 
                            One, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000010, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            0x02, 
                            0x11, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000020, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            0x03, 
                            0x11, 
                            0x015E
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000030, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            0x03, 
                            0x11, 
                            0xC8
                        }
                    })
                }

                If (LAnd (LNot (And (CFGD, 0x80)), And (CFGD, 0x40
                    )))
                {
                    Return (Package (0x04)
                    {
                        0x03, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000000, // Address
                                    0x01,               // Access Size
                                    )
                            }, 

                            One, 
                            One, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000010, // Address
                                    0x01,               // Access Size
                                    )
                            }, 

                            0x02, 
                            0x11, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000020, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            0x03, 
                            0x11, 
                            0x015E
                        }
                    })
                }

                If (And (CFGD, 0x20))
                {
                    Return (Package (0x03)
                    {
                        0x02, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000000, // Address
                                    0x01,               // Access Size
                                    )
                            }, 

                            One, 
                            One, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x01,               // Bit Width
                                    0x02,               // Bit Offset
                                    0x0000000000000010, // Address
                                    0x01,               // Access Size
                                    )
                            }, 

                            0x02, 
                            0x11, 
                            0x01F4
                        }
                    })
                }

                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x01,               // Bit Width
                                0x02,               // Bit Offset
                                0x0000000000000000, // Address
                                0x01,               // Access Size
                                )
                        }, 

                        One, 
                        One, 
                        0x03E8
                    }
                })
            }

            If (And (CFGD, 0x00200000))
            {
                If (And (CFGD, 0x80))
                {
                    Return (Package (0x05)
                    {
                        0x04, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            One, 
                            0x20, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000814, // Address
                                    ,)
                            }, 

                            0x02, 
                            0x60, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000815, // Address
                                    ,)
                            }, 

                            0x03, 
                            0x80, 
                            0x015E
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000816, // Address
                                    ,)
                            }, 

                            0x03, 
                            0xA0, 
                            0xC8
                        }
                    })
                }

                If (LAnd (LNot (And (CFGD, 0x80)), And (CFGD, 0x40
                    )))
                {
                    Return (Package (0x04)
                    {
                        0x03, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            One, 
                            0x20, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000814, // Address
                                    ,)
                            }, 

                            0x02, 
                            0x60, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000815, // Address
                                    ,)
                            }, 

                            0x03, 
                            0x80, 
                            0x015E
                        }
                    })
                }

                If (And (CFGD, 0x20))
                {
                    Return (Package (0x03)
                    {
                        0x02, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            One, 
                            0x20, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000814, // Address
                                    ,)
                            }, 

                            0x02, 
                            0x60, 
                            0x01F4
                        }
                    })
                }

                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        One, 
                        0x03E8
                    }
                })
            }

            Return (Package (0x02)
            {
                One, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    One, 
                    One, 
                    0x03E8
                }
            })
        }
    }

    Scope (_PR.P002)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC1, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P003)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC2, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P004)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC3, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P005)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC4, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P006)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC5, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P007)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC6, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

    Scope (_PR.P008)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC7, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    One, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        One, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (^^P001._CST ())
        }
    }

/* Hack code end/ Final del hack */