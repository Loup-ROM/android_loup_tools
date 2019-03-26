#!/bin/bash

cd ${WORKSPACE}
/usr/bin/repo sync -c -n --force-sync -j 16 && /usr/bin/repo sync -c -l -j 16 
chmod +x loup/tools/build.sh 
loup/tools/build.sh santoni $1

# Upload our new build
sshpass -p "$sfpass" scp -o "StrictHostKeyChecking no" '$WORKSPACE/out/target/product/$1/lineage-*.zip.md5sum' $sfusername:$sfproject/LOS141
sshpass -p "$sfpass" scp -o "StrictHostKeyChecking no" '$WORKSPACE/out/target/product/$1/lineage-*.zip' $sfusername:$sfproject/LOS141

# Create delta


