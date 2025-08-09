#!/bin/sh
TEMP=$(sensors | grep 'Sensor 1' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
echo "$CPU_USAGE $TEMP" | awk '{ printf(" CPU:%6s \n"), $1, $2 }'
