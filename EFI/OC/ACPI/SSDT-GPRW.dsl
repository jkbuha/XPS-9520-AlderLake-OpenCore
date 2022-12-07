/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLDLQNMT.aml, Wed Nov 30 10:47:55 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000065 (101)
 *     Revision         0x02
 *     Checksum         0x16
 *     OEM ID           "OCLT"
 *     OEM Table ID     "GPRW"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "GPRW", 0x00000000)
{
    External (XPRW, MethodObj)    // 2 Arguments

    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }
        }

        Return (XPRW (Arg0, Arg1))
    }
}
