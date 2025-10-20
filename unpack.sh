#!/bin/bash

if [ $# != "1" ]
then
    echo "Unpack: Filename"
    exit 0
fi

if [ ! -f $1 ]; then
    echo "Not a File."
    exit 0;
fi

declare -i sizesuper=$( stat -c %s $1 )

MAGIC="12884901888"

if [ "${sizesuper}" != "${MAGIC}" ]; then
    echo "MAGIC Number Size Check Failed."
    exit 0;
fi

tool_present=$( locate lpunpack | wc -l )

if [ "${tool_present}" == "0" ]; then
    echo "Failed to find required tool: LPUNPACK in path."
    exit 0;
fi

rm -f ./system_a.img
rm -f ./vendor_a.img
rm -f ./product_a.img

lpunpack --slot=0 $1

rm *_b.img
