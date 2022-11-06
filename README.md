Dell XPS 9520 macOS Monterey with OpenCore

This is mostly a work in progress. With this latest configuration it is 
possible to install and run MacOS Monterey without graphics acceleration 
(yet!).

Ahead of installing, as with other hackintoshes you will need to disable 
CFG_LOCK using modgrubEFI as follows:

setup_var_cv CpuSetup 0x43 0x01 0x00


