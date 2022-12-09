/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL0AVMQ1.aml, Fri Dec  9 12:56:58 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000003B6 (950)
 *     Revision         0x02
 *     Checksum         0x2E
 *     OEM ID           "HACK"
 *     OEM Table ID     "I2C"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "HACK", "I2C", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments
    External (_SB_.GPI0, DeviceObj)
    External (_SB_.INUM, MethodObj)    // 1 Arguments
    External (_SB_.PC00.HIDD, MethodObj)    // 5 Arguments
    External (_SB_.PC00.HIDG, BuffObj)
    External (_SB_.PC00.I2C1, DeviceObj)
    External (_SB_.PC00.I2C1.I2CX, IntObj)
    External (_SB_.PC00.I2C1.TPD1, DeviceObj)
    External (_SB_.PC00.I2CM, MethodObj)    // 3 Arguments
    External (_SB_.PC00.TP7D, MethodObj)    // 6 Arguments
    External (_SB_.PC00.TP7G, BuffObj)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (EV12, MethodObj)    // 2 Arguments
    External (FMD1, IntObj)
    External (FMH1, IntObj)
    External (FML1, IntObj)
    External (GPDI, FieldUnitObj)
    External (GPHD, FieldUnitObj)
    External (I2CN, IntObj)
    External (I2CX, IntObj)
    External (SDS1, FieldUnitObj)
    External (SSD1, IntObj)
    External (SSH1, IntObj)
    External (SSL1, IntObj)
    External (TPDB, FieldUnitObj)
    External (TPDH, FieldUnitObj)
    External (TPDM, FieldUnitObj)
    External (TPDS, FieldUnitObj)
    External (TPDT, FieldUnitObj)
    External (TPHD, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPHD = Zero
        }
    }

    Scope (_SB.PC00.I2C1)
    {
        Device (TPD1)
        {
            Name (HID2, Zero)
            Name (ITPN, "DELL0B19")
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PC00.I2C1",
                    0x00, ResourceConsumer, _Y00, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y01)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PC00.I2C1.TPD1._Y00._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PC00.I2C1.TPD1._Y00._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PC00.I2C1.TPD1._Y01._INT, INT2)  // _INT: Interrupts
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (CondRefOf (TPHD)){}
                INT1 = GNUM (GPDI)
                INT2 = INUM (GPDI)
                If ((TPDM == Zero))
                {
                    SHPO (GPDI, One)
                }

                If (CondRefOf (TPHD))
                {
                    ITPN = ToString (TPHD, Ones)
                }

                HID2 = TPDH /* External reference */
                BADR = TPDB /* External reference */
                If ((TPDS == Zero))
                {
                    SPED = 0x000186A0
                }

                If ((TPDS == One))
                {
                    SPED = 0x00061A80
                }

                If ((TPDS == 0x02))
                {
                    SPED = 0x000F4240
                }
            }

            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (ITPN) /* \_SB_.PC00.I2C1.TPD1.ITPN */
            }

            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Name (DRDY, Zero)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((DRDY == Zero))
                {
                    If ((Arg0 == HIDG))
                    {
                        DRDY = One
                        EV12 (Zero, Zero)
                    }
                }

                If ((Arg0 == HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If ((Arg0 == TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
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

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
           //     Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFG))
                  Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
    }
}

