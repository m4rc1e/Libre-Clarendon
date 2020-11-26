#!/bin/sh
set -e

DST=../fonts/LibreClarendon[wdth,wght].ttf

echo "Generating VFs"
fontmake -g LibreClarendon.glyphs -o variable --output-path $DST

rm -rf master_ufo/ instance_ufo/

gftools fix-family $DST --inplace
gftools gen-stat $DST --axis-order wdth wght --inplace
