USB UHCI hack 2

This hack adds an id of a Mac to the USB to make it more compatible with OSX.



Device (UHC1)
            {
                Name (_ADR, 0x001D0000)
                Name (UPS1, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x34, 0x3a, 0x00, 0x00  /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x001D0001)
                Name (UPS1, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x35, 0x3a, 0x00, 0x00  /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (UHC3)
            {
                Name (_ADR, 0x001D0002)
                Name (UPS1, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x36, 0x3a, 0x00, 0x00   /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x001A0000)
                Name (UPS1, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x37, 0x3a, 0x00, 0x00     /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (UHC5)
            {
                Name (_ADR, 0x001A0001)
                Name (UPS1, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x38, 0x3a, 0x00, 0x00   /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (UHC6)
            {
                Name (_ADR, 0x001A0002)
                Name (UPS1, Package (0x02)
                {
                    0x20, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x39, 0x3a, 0x00, 0x00   /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                Name (UPS1, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0x62, 0x02)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URE2,   9
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URE2)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x01FF, URE2)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x3a, 0x3a, 0x00, 0x00   /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                Name (UPS1, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_PRW, 0, NotSerialized)
                {
                    Return (UPS1)
                }

                OperationRegion (USBR, PCI_Config, 0x62, 0x02)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URE2,   9
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URE2)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x01FF, URE2)
                    }
                }
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                            0x3c, 0x3a, 0x00, 0x00   /*<--------- ID MAC------*/
                        }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }
