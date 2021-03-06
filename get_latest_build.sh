#!/bin/bash

git clone "https://$ghuser:$ghpass@github.com/$ghuser/android_loup_ota.git" -b opendelta

export DEVICE=$1
jq '.["./'$DEVICE'"] | .[-1] | .["filename"]' android_loup_ota/devices.json
LATEST=$(jq '.["./'$DEVICE'"] | .[-1] | .["filename"]' android_loup_ota/devices.json)
export LATEST=$(echo "${LATEST//\"}")

# Create delta folder structure
rm -rf $WORKSPACE/deltas
mkdir -p $WORKSPACE/deltas/last/$DEVICE
mkdir -p $WORKSPACE/deltas/current/$DEVICE

# Download latest and preserve filename
echo $LATEST > latest-file
cd $WORKSPACE/deltas/current/$DEVICE
curl -L -O -J https://sourceforge.net/projects/loup-rom/files/LOS-14.1/$LATEST/download
cd -
