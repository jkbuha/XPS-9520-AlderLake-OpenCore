/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLoommSd.aml, Sun Dec  4 17:45:09 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000049 (73)
 *     Revision         0x02
 *     Checksum         0x90
 *     OEM ID           "CORP"
 *     OEM Table ID     "AWAC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "IDLE", 0x00000000)
{
    
    Scope (_SB)
    {
        Method (LPS0, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (One)
            }
        }
    }

    Scope (_GPE)
    {
        Method (LXEN, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (One)
            }
        }
    }

}

