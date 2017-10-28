#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

if [ -z "$WIDTH" ]; then
    echo "Warning: bootanimation width not specified"
    echo "Warning: Using Default: WIDTH: 1440"
    WIDTH="1440"
fi

if [ -z "$HEIGHT" ]; then
    echo "Warning: bootanimation height not specified"
    echo "Warning: Using Default: HIGHT: 2560"
    HEIGHT="2560"
fi

if [ "$HALF_RES" = "true" ]; then
    WIDTH=$(expr $WIDTH / 2)
    HEIGHT=$(expr $HEIGHT / 2)
fi

RESOLUTION=""$WIDTH"x"$HEIGHT""

for part_cnt in 0 1 2 3 4
do
    mkdir -p $ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$part_cnt
done
tar xfp "vendor/pure/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".jpg"

# Create desc.txt
echo "$WIDTH $HEIGHT" 15 > "$OUT/bootanimation/desc.txt"
cat "vendor/pure/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
