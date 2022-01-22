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
            continue
            commands = line.split('=')[1].split(':')
            for cmd in commands:
                subprocess.run(['sudo', 'apt', 'install', cmd]) 
        elif line.startswith('@reqdir'):
            directories = line.split('=')[1].split(':')
            for directory in directories:
                targetdir = homedir / directory
                if not targetdir.is_dir():
                    targetdir.mkdir(parents=True)
        else:
            line_str = line.strip()
            if line_str == "":
                continue
            elms = line.strip().split(':')
            if elms[1] == "":
                src = elms[0]
                dst = "." + src
            else:
                src, dst = elms
            srcpath = cdir / src
            dstpath = homedir / dst
            if dstpath.exists():
                old_dst = dstpath.parent / (dstpath.name + ".old")
                dstpath.rename(old_dst)
            dstpath.symlink_to(srcpath)
