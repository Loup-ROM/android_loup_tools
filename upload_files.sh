#!/bin/bash
DEVICE=$1

sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "'$WORKSPACE/deltas/jni/publish/$DEVICE/lineage-*.sign'" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "'$WORKSPACE/deltas/jni/publish/$DEVICE/lineage-*.delta'" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "'$WORKSPACE/deltas/jni/publish/$DEVICE/lineage-*.update'" "$sfusername:$sfproject/LOS-14.1/deltas/$DEVICE"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "'$WORKSPACE/out/target/product/$DEVICE/lineage-*.zip.md5sum'" "$sfusername:$sfproject/LOS-14.1"
sshpass -p $sfpass scp -o "StrictHostKeyChecking no" "'$WORKSPACE/deltas/current/$DEVICE/lineage-*.zip'" "$sfusername:$sfproject/LOS-14.1"
