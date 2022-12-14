# Dell XPS 9520 macOS Monterey with OpenCore

![hackintosh](./screenshot/screen.jpg)

# Details

| OpenCore Version | 0.8.5 |
| --- | --- |
| macOS Version | 12.6.1 (Monterey) |
| SMSBios | MacBookPro16,4 |

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
| S3 | Sleep/Wake | 🔶 Partially working |
| GPU | Intel Iris Xe Graphics | ❌ Not Working |
| eGPU | AMD Sapphire Radeon RX580 | ✅ Working |
| Display | 1920 x 1200 FHD LCD | ✅ Working |

# Overview

This is mostly a work in progress. With this latest configuration it is 
possible to install and run MacOS Monterey without graphics acceleration 
(yet!) but it will run smoothly with any eGPU (tested with an RX580).

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

# S3 ACPI
Despite Dell's attempts to remove S3 from the sleep options, it's possible, in theory at least, to get S3 working using a combination of IFR edits 
and ACPI table changes. The first step is to re-enable S3 from the UEFI interface using modGRUBshell:

```bash
setup_var_cv Setup 0xE 0x01
```

S3 will be present in the macOS boot-up sequence, and will go to sleep but will crash upon startup. ACPI table edits to restore post-S3 sleep states 
are required, and this is currently WIP.


# Known Issues

- S3 Sleep not working properly yet
- Wake not working
- LVDS display remains on/inactive when eGPU connected

