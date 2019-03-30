#!/bin/bash
DEVICE=$1
FILENAME=$2
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME.sign" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME.delta" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME.update" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/out/target/product/$DEVICE/$FILENAME.zip.md5sum" "$sfusername:$sfproject/LOS-14.1"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/current/$DEVICE/$FILENAME.zip" "$sfusername:$sfproject/LOS-14.1"
