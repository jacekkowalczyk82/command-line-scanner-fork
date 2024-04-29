#!/bin/bash

set -x 

if ! [ -x "$(command -v scanimage)" ]; then
  echo 'Error: "scanimage" is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v convert)" ]; then
  echo 'Error: "imagemagic" is not installed.' >&2
  exit 1
fi

if [ -z "$1" ]
then
    echo "Please specify the output file path." >&2
    exit 1
fi

DEVICE=$(scanimage --formatted-device-list "%d" | head -n 1)

if [ -z "$DEVICE" ]
then
    echo "No scanning device found. Please make sure you are installed the correct drivers."
    exit 1
fi

echo "Using the device $DEVICE"

#TEMP_TIFF=$(mktemp --suffix=.tiff)
#echo "Scanning to a temp file $TEMP_TIFF"

DIR_NAME=$(dirname $0)

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
INDEX_NUMBER=0
if [ -e .COUNTER_${1} ]; then 
    OLD_VALUE=$(cat .COUNTER_${1})
    echo "OLD_VALUE: $OLD_VALUE"
    INDEX_NUMBER=$(python3 ${DIR_NAME}/increment.py ${OLD_VALUE})
    echo "$INDEX_NUMBER"
else     
    INDEX_NUMBER=1
    
fi 
echo "$INDEX_NUMBER" > .COUNTER_${1}


FILE_NAME="${1}_${INDEX_NUMBER}_${TIMESTAMP}.tiff"
scanimage -d "$DEVICE" --format tiff > $FILE_NAME

# ORDERED_PAGES=$(python3 ${DIR_NAME}/order_list.py {1})
# convert $ORDERED_PAGES ${1)_${TIMESTAMP}.pdf

#echo "Converting the image to the specified format and saving it to the file $1"
#convert $FILE_NAME $1

