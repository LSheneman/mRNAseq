#!/bin/bash
#Setup mouse reference info

python /usr/local/share/eel-pond/make-namedb.py mouse.protein.faa mouse.namedb
python -m screed.fadbm mouse.protein.faa