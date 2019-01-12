DEST_DIR=$1

if [ ! -d "$DEST_DIR/lib" ];then
	mkdir -p $DEST_DIR/lib
fi

cp -f BasicUsageEnvironment/*.a $DEST_DIR/lib/
cp -f groupsock/*.a $DEST_DIR/lib/
cp -f liveMedia/*.a $DEST_DIR/lib/
cp -f UsageEnvironment/*.a $DEST_DIR/lib/

if [ ! -d "$DEST_DIR/include" ]; then
    mkdir -p $DEST_DIR/include
fi

cp -f  UsageEnvironment/include/* $DEST_DIR/include/
cp -f  groupsock/include/* $DEST_DIR/include/
cp -f  BasicUsageEnvironment/include/* $DEST_DIR/include/
cp -f  liveMedia/include/* $DEST_DIR/include/
