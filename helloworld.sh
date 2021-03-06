#!/bin/bash

file=`readlink -f "$0"`
templates="`dirname \"$file\"`/templates"

if [ -z "$1" ]; then
    echo ""
    echo "Usage: $0 TEMPLATE"
    echo ""
    echo "Templates:"
    echo "----------"
    echo `ls "$templates"`
    echo ""
    exit 1
fi

if [ ! -d "$templates/$1" ]; then
    echo ""
    echo "Template not found: $1"
    echo ""
    echo "Templates:"
    echo "----------"
    echo `ls "$templates"`
    echo ""
    exit 1
fi

if [ -z `ls -A "$templates/$1"` ]; then
    echo ""
    echo "No template files found for: $1"
    echo ""
    exit 1
fi


pushd "$templates/$1" > /dev/null
echo ""
echo "Files to copy: `ls *`"
echo ""
popd > /dev/null

cp -i -R "$templates/$1/"* .
