#!/bin/bash

git clone "https://$ghuser:$ghpass@github.com/$ghuser/android_loup_ota.git" -b opendelta
cd android_loup_ota

DEVICE=$1
LATEST=$(jq '.["./'$DEVICE'"] | .[-1] | .["filename"]' devices.json)
export LATEST=$(echo "${LATEST//\"}")
cd -

# Create delta folder structure
rm -rf $WORKSPACE/deltas
mkdir -p $WORKSPACE/deltas/last/$DEVICE
mkdir -p $WORKSPACE/deltas/current/$DEVICE

# Download latest and preserve filename
cd $WORKSPACE/deltas/current/$DEVICE
curl -L -O -J https://sourceforge.net/projects/loup-rom/files/LOS-14.1/$LATEST/download
cd -