# Disk Logical Lock

## What can it do
It can lock your disk and make your disk unbootable, and you can't start Windows, Windows RE / PE, MS-DOS or even linux. \
NOTE: It's dangerous to use it in real machine, so please run it in virtual machine.

## How to use
Download the latest release or compile it.

### How to lock the disk
Open command prompt and enter `lockdisk \\.\PhysicalDrive<NUM> -l`.
Please replace `<NUM>` with your disk number.

### How to unlock the disk
Open command prompt and enter `lockdisk \\.\PhysicalDrive<NUM> -u`.
Please replace `<NUM>` with your disk number.

## How to unlock the disk if you can't boot
### for IDE disk
1. Write `unlock.img` to a floppy or a USB drive.
2. Boot using this floppy/USB drive, and follow the prompts on the screen, your disk will be unlocked.
3. Reboot your computer using your disk.
4. If you still fail to boot, try to use the fix steps for SCSI disk.
### for SCSI disk
1. Create a bootable FreeDOS USB drive containing partition tools. (e.g. DiskGenius)
2. Boot using this USB drive, and empty the sector 0, sector 1024, and then you can reboot to Windows PE.
3. Write sector 9 to sector 0 and sector 10 to sector 1024.
4. In newer systems that use BCD to manage boot may fail to boot, so you must fix the BCD if you are using newer systems.
