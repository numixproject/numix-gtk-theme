#!/bin/bash

if [[ -z $1 ]] ; then
 echo "Usage: $0 [FILE]"
 exit 0
else
 FILENAME=$1
fi

PREFIX=EXP-

for ID in `grep -o "id=\"$PREFIX.*\"" $FILENAME | cut -d\" -f2` ; do
 OUTPUT=${ID#$PREFIX}.png
 echo "Exporting area $ID to $OUTPUT..."
 inkscape --export-id=$ID --export-png=$OUTPUT --file=$FILENAME
done