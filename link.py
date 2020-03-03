#!/usr/bin/env python3
from pathlib import Path
import subprocess

homedir = Path.home()
cdir = Path('.').resolve()

with Path('./srcdist.txt').open('r') as fin:
    for line in fin:
        if line.startswith('#'):
            continue
        elif line.startswith('@reqcmd'):
            commands = line.split('=')[1].split(':')
            for cmd in commands:
                subprocess.run(['sudo', 'apt', 'install', cmd]) 
        elif line.startswith('@reqdir'):
            directories = line.split('=')[1].split(':')
            for directory in directories:
                (homedir / directory).mkdir(parents=True)
        else:
            src, dst = line.strip().split('=').split(':')
            if dst == "":
                dst = "." + src
            srcpath = cdir / src
            dstpath = homedir / dst
            srcpath.symlink_to(dstpath)
