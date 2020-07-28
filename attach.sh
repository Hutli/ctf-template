#!/bin/sh
python exploit.py --gdbplugin pwndbg --ld ld-2.27.so --libc libc-2.27.so --pre-load-libc --auto-patch --exec attach --program ropmev2