CLamshell addon hack intel GMA:

Locate SB scope, inside you will find PWRB , place this code above PWRB.


Device (PNLF)
{
    Name (_HID, EisaId ("APP0002"))
    Name (_CID, "backlight")
    Name (_UID, 0x0A)
    Name (_STA, 0x0B)
}



Place this under your graphics section on DSDT:



Method (_DSM, 4, NotSerialized)
                {
                    Store (Package ()
                        {
                            "AAPL,slot-name",
                                 Buffer () {"Built in"},
                            "AAPL,Haslid",
                                 Buffer () {0x01, 0x00, 0x00, 0x00},
                            "AAPL,aux-power-connected",
                                 Buffer () {0x01, 0x00, 0x00, 0x00},
                            "AAPL,backlight-control",
                                 Buffer () {0x01, 0x00, 0x00, 0x00},
                            "AAPL,BacklightRestore",
                                 Buffer () {0x01, 0x00, 0x00, 0x00},
                            "AAPL,HasPanel",
                                 Buffer () {0x01, 0x00, 0x00, 0x00},
                            "AAPL01,BacklightIntensity",
                                 Buffer () {0x4E, 0x00, 0x00, 0x00},
                            "device_type",
                                 Buffer () {"display"},
                            "model",
                                 Buffer () {"GMA950"},
                            "built-in",
                                 Buffer () {0x00}
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }