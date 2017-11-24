source ./setenv-android.sh
cd src/openssl-1.0.2l
./config no-shared --openssldir=/Users/hsyuan/openssl-android --prefix=/Users/hsyuan/openssl-android
make depend
make all -j8
make install

