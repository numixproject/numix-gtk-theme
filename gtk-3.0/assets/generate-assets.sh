#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

echo -en ${NORMAL}

function export_asset {
    case "$1" in
        checkbox-*.png|radio-*.png)
            # Available in checkbox-radiobox-assets.svg

            target="$1"
            layer="${target%.*}"

            echo -en "Generating ${BOLD}$target${NORMAL}..."

            inkscape checkbox-radiobox-assets.svg -i "$layer" -j -C --export-png="$target" &> /dev/null

            if [ $? -ne 0 ]; then
                # tput hpa $(( $(tput cols) - 8 ))
                tput hpa 70
                echo -e "${RED}${BOLD}[failed]${NORMAL}"
                return 1
            else
                tput hpa 70
                echo -e "${GREEN}${BOLD}[ done ]${NORMAL}"
                return 0
            fi
            ;;

        menuitem-*|grid-selection-*)
            # These are not yet available as SVG.

            echo -en "Generating ${BOLD}$target${NORMAL}..."
            tput hpa 70
            echo -e "${BOLD}[ skip ]${NORMAL}"
            return 0
            ;;

        *)
            echo -en "Generating ${BOLD}$target${NORMAL}..."
            tput hpa 70
            echo -e "${RED}${BOLD}[failed]${NORMAL}"
            return 1
            ;;
    esac
}

case "$1" in
    all)
        exitcode=0

        for target in *.png; do
            export_asset "$target"
            exitcode=$(( $exitcode || $? ))
        done

        exit $exitcode
        ;;

    "")
        echo "Usage: generate-assets.sh all | asset.png [ asset2.png ... ]"
        exit 1
        ;;

    *)
        exitcode=0

        for target in "$@"; do
            export_asset "$target"
            exitcode=$(( $exitcode || $? ))
        done

        exit $exitcode
        ;;
esac
