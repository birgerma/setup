#!/bin/bash

# Installation instructions taken from https://github.com/sebastiw/keyboard-layout

NAME=colemak-plus
PRETTY_NAME="Colemak Plus"

cp ./colemak-plus.x11 /usr/share/X11/xkb/symbols/$NAME

sed -i "\|! layout|a\  ${NAME}\t\t  ${PRETTY_NAME}" /usr/share/X11/xkb/rules/base.lst

sed -i "\|<layoutList>|a\\\t\\t<layout>\n\t\t\t<configItem>\n\t\t\t\t<name>${NAME}</name>\n\t\t\t\t<shortDescription>${NAME}</shortDescription>\n\t\t\t\t<description>${PRETTY_NAME}</description>\n\t\t\t\t<languageList>\n\t\t\t\t\t<iso639Id>eng</iso639Id>\n\t\t\t\t</languageList>\n\t\t\t</configItem>\n\t\t</layout>" /usr/share/X11/xkb/rules/base.xml

