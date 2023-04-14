copy /y lockedsample.img locked.img
QEMU\qemu -L %cd%\QEMU -m 1024 -bios bios.bin -hda locked.img -fda unlock\unlock.img -boot a
pause