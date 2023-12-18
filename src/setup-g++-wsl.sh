# nasm and qemu

sudo apt-get install -y nasm qemu qemu-kvm curl

# GCC cross compiler for i386 systems (might take quite some time, prepare food)

sudo apt update
sudo apt install make
sudo apt install build-essential
sudo apt install bison
sudo apt install flex
sudo apt install libgmp3-dev
sudo apt install libmpc-dev
sudo apt install libmpfr-dev
sudo apt install texinfo


export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"


curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.gz
tar xf binutils-2.41.tar.gz

mkdir binutils-build
cd binutils-build

../binutils-2.41/configure --target=$TARGET --enable-interwork --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log

sudo make all install 2>&1 | tee make.log

cd ..

curl -O https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz
tar xf gcc-13.2.0.tar.gz

mkdir gcc-build
cd gcc-build

echo Configure: . . . . . . .
../gcc-13.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-language=c,c++ --without-headers --enable-multilib

sudo make all-gcc

sudo make all-target-libgcc

sudo make install-gcc

sudo make install-target-libgcc

ls /usr/local/i386elfgcc/bin
export PATH="$PATH:/usr/local/i386elfgcc/bin"