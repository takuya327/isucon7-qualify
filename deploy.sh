#/bin/bash

TARGET_HOSTS=`cat <<EOS
118.27.1.84
118.27.16.184
EOS`
USER=isucon
SRC_DIR=`pwd`

DEST_DIR=/home/isucon/isubata/webapp/go/src/isubata

for HOST in $TARGET_HOSTS; do
	echo "rsync to ${HOST}"
	rsync -arq --delete-after --exclude=".git" --exclude=".gitignore" --exclude="deploy.sh" \
		${SRC_DIR} ${USER}@${HOST}:${DEST_DIR}/
	echo "restart isubata.golang.service on ${HOST}"
	ssh ${USER}@${HOST} sudo systemctl restart isubata.golang.service
done
