//Add new PS2N
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "PS2N", 0)
{
#endif
    External(_SB.PCI0.LPCB, DeviceObj)
    Scope (_SB.PCI0.LPCB)
    {
        Device (PS2N)
        {
            Method (_HID, 0, NotSerialized)
            {
                Return ("PS2N")
            }
            Name (_CID, Package ()
            {
                EisaId ("PNP0F13"), 
                EisaId ("PNP0F03")
            })
            Name (_CRS, ResourceTemplate ()
            {
                IRQNoFlags ()
                    {12}
            })
            
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
