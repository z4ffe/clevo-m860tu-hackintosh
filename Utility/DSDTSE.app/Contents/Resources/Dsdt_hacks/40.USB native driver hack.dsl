USB native driver hack:

Locate your usb devices and add this code to each one, changing the values from device id with the one supplied under the code:


   Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x0f)
                        {
                            "device-id",
                            Buffer (0x04)
                            {
                                0x34, 0x3A, 0x00, 0x00  //the values below
                            },
                            "AAPL,clock-id",   // property needed for sleep support
                            Buffer (One)
                            {
                                0x0a  
                            },

                                "built-in",
                                Buffer ()
                                {
                                        0x00
                                },

                              "device_type",   //not sure it is useful
                              Buffer (0x05)
                              {
                                  "EHCI"
                              },

                            
                            "AAPL,current-available",
                            0x04B0,
                            "AAPL,current-extra",
                            0x02BC,
                            "AAPL,current-in-sleep",  // to solve a problem with sleep when stick is inserted
                            0x03E8,

                            Buffer (0x01)
                            {
                                0x00
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

DeviceIDs
Intel
USB1 - 0x2830
USB2 - 0x2831
USB3 - 0x2832
USB4 - 0x2834
USB5 - 0x2835
EHC1 - 0x2836
EHC2 - 0x283a
nForce
USB1 - 0x0aa5
USB2 - 0x0aa7
EHC1 - 0x0aa6
EHC2 - 0x0aa9