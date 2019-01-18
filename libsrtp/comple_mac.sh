if [ -d "build"];then
    rm -rf build
fi

mkdir build
cd build 
cmake -DLIBRARY_OUTPUT_PATH=`pwd`/../lib ..
make

