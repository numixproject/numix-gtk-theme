#!/bin/bash

SVGTABLE="assets/all-assets.svg"
IDPRFX="EXP-"

for ID in $(sed -n 's/.*id="\('"$IDPRFX"'[^"]\+\)".*/\1/p' $SVGTABLE); do
    echo "Generating 'assets/${ID#$IDPRFX}.png' ..."
    inkscape --without-gui --export-id=$ID --export-png=assets/${ID#$IDPRFX}.png $SVGTABLE
done
