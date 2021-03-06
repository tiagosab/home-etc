#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright (C) 2015 Tiago Saboga <tiagosaboga@gmail.com>
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
'''offlineimap.py: my folder filter for offlineimap.'''


folders = ['INBOX', 'pol/bspinoza', 'vf', 'auto-envio', 'herio',
           'lixo', 'velhos/2009-2010', 'velhos/2009-2010/herio',
           'velhos/2009-2010/virginia',
           'velhos/2009-2010/incoming', 'Trash', 'Drafts',
           '[Gmail]/Sent Mail', '[Gmail]/Trash', 'banco',
           'hack/gitenberg-dev']

recursivefolders = ['amigos']

def main():
    with open('/home/tiago/.offlineimap.folders', 'w') as f:
        f.write('')

def ts_folderfilter(foldername):
    with open('/home/tiago/.offlineimap.folders', 'a') as f:
        f.write(foldername)
        f.write("\n")
        include = False
        if foldername in folders:
            include = True
        elif any([foldername.startswith(x) for x in recursivefolders]):
            include = True
        if include:
            f.write("^^^^^^^^^^^^^^^^^^^^\n")
    return include

if __name__ == "__main__":
    main()
