DEST_DIR=$1

if [ ! -d "$DEST_DIR/lib" ];then
	mkdir -p $DEST_DIR/lib
fi

cp -f BasicUsageEnvironment/*.a $DEST_DIR/lib/
cp -f groupsock/*.a $DEST_DIR/lib/
cp -f liveMedia/*.a $DEST_DIR/lib/
cp -f UsageEnvironment/*.a $DEST_DIR/lib/



cp -a UsageEnvironment/include/* $DEST_DIR/include/
cp -a groupsock/include/* $DEST_DIR/include/
cp -a BasicUsageEnvironment/include/* $DEST_DIR/include/
cp -a liveMedia/include/* $DEST_DIR/include/
