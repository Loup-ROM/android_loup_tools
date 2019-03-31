#!/bin/bash
DEVICE=$1
FILENAME_OLD=$2
FILENAME_NEW=$3
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME_OLD.sign" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME_OLD.delta" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/jni/publish/$DEVICE/$FILENAME_OLD.update" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/out/target/product/$DEVICE/$FILENAME_NEW.zip.md5sum" "$sfusername:$sfproject/LOS-14.1"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "$WORKSPACE/deltas/current/$DEVICE/$FILENAME_NEW.zip" "$sfusername:$sfproject/LOS-14.1"
