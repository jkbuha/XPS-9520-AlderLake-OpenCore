# Dell XPS 9520 macOS Ventura with OpenCore

![hackintosh](./screenshot/screen.jpg)

# Details

| OpenCore Version | 1.0.0 |
| --- | --- |
| macOS Version | 13.6.7 (Ventura) |
| SMBios | MacPro7,1 |

# Hardware Specifications

| Hardware | Specification | Status |
| --- | --- | --- |
| CPU | Intel Core i9-12900HK | ✅ Working |
| RAM | DDR5 64GB | ✅ Working |
| Audio | Realtek ALC3281 | ✅ Working |
| WiFi | Killer 1675 (AX211) | ✅ Working |
| Bluetooth | AX211 Wi-Fi 5 | ✅ Working |
| SSD | Crucial P5 2TB | ✅ Working |
| Keyboard | - | ✅ Working |
| Trackpad | I2C Connection | ✅ Working |
| Webcam | Microdia RGB IR HD camera | ✅ Working |
| MicroSD Card | RTS5260 Card Reader | 🔶 Partially working |
| Fingerprint Sensor | Shenzen Goodix | 🔶 Partially working |
| S4 | Hibernation | 🔶 In progress |
| GPU | Intel Iris Xe Graphics | ❌ Not Working |
| eGPU | AMD Sapphire Radeon RX6650XT | ✅ Working |
| Display | 1920 x 1200 FHD LCD | ✅ Working |

# Overview

The XPS 9520 (with the 14-core i9 processor) is a solid workhorse. With this latest configuration it is 
possible to install and run macOS Ventura smoothly with any eGPU (tested with an RX580 and an RX6650XT).

# BIOS Settings

| Setting | Option |
| --- | --- |
| SATA Operation | AHCI |
| Fast Boot | Thorough |
| Secure Boot | Disabled |
| TMP 2.0 Security | Disabled |
| Intel SGX | Disabled |
| VT for Direct I/O | Disabled |
| Fingerprint Reader | Disabled |

# UEFI IFR edits
Ahead of installing, as with other hackintoshes you will need to disable 
CFG_LOCK using modGRUBshell as follows:

```bash
setup_var_cv CpuSetup 0x43 0x00
```

# S3/S4 ACPI
Despite Dell's attempts to sabotage S3 sleep, there's an ongoing effort to render hiberation (S4) and then
sleep (S3) working again on this machine, having successfully enabled it on the XPS 9500. Currently WIP...
The first step is to re-enable S3 from the UEFI interface using modGRUBshell:

```bash
setup_var_cv Setup 0xE 0x01
```

S3 will be present in the macOS boot-up sequence, and will go to sleep but will crash upon startup. ACPI table edits to restore post-S3 sleep states 
are required, and this is currently WIP.


# Known Issues

- S3 Sleep not working properly yet
- S4 Sleep currently being worked on
- LVDS display remains off when eGPU connected

To allow the laptop to function in clamshell mode, you need to press Fn+F8 
on the clover boot menu to switch to the external display. That way the 
laptop LVDS screen is switched off and the external monitor is on. You 
need to connect a USB/Bluetooth mouse and keyboard, but the setup is much 
more practical in this way.

