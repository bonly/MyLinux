#!/bin/bash -x
sudo apt-get install build-essential subversion git-core checkinstall automake
if [ ! "$(uname -m)" = "x86_64" ]; then
ARCHOPTS="w32codecs"
else
ARCHOPTS=""
fi
sudo wget http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list \
--output-document=/etc/apt/sources.list.d/medibuntu.list &&
sudo apt-get -q update &&
sudo apt-get --yes -q --allow-unauthenticated install medibuntu-keyring &&
sudo apt-get -q update &&
sudo apt-get install -y libdvdcss-dev $ARCHOPTS
sudo apt-get install yasm libfaac-dev libfaad-dev libmp3lame-dev libopencore-amrnb-dev \
libopencore-amrwb-dev zlib1g-dev libqt4-dev libhal-dev lua5.1 liblua5.1-0-dev libdvdread-dev \
libtag1-dev libmad0-dev libdvbpsi5-dev liba52-0.7.4-dev libv4l-dev libcdio-dev \
libvcdinfo-dev libfribidi-dev libfluidsynth-dev libmpeg2-4-dev libschroedinger-dev \
libvorbis-dev libspeex-dev libgcrypt11-dev libcddb2-dev libproxy-dev libnotify-dev \
libebml-dev libmpcdec-dev libcaca-dev libaa1-dev libmatroska-dev xulrunner-dev \
libasound2-dev libass-dev libavahi-client-dev libdca-dev libdvdnav-dev libfaad-dev \
libflac-dev libfreetype6-dev libggi2-dev libgl1-mesa-dev libglib2.0-0 libgnutls-dev \
libid3tag0-dev libjack-dev liblircclient-dev libmodplug-dev libncursesw5-dev \
libogg-dev libpng12-dev libpulse-dev libsdl-image1.2-dev libsdl1.2-dev libshout3-dev \
libsmbclient-dev libsvga1-dev libsysfs-dev libtar-dev libtwolame-dev libudev-dev \
libupnp3-dev libx11-dev libxcb-keysyms1-dev libxext-dev libxml2-dev libxpm-dev \
libxt-dev libxv-dev libxcb-shm0-dev libxcb-xvmc0-dev libx11-xcb-dev \
libmtp-dev libsqlite3-dev libgnomevfs2-dev librsvg2-dev libzvbi-dev libxcb-randr0-dev \
liboggkate-dev libkate-dev libpango1.0-dev libcairo2-dev libprojectm-dev qt4-qtconfig cmake
mkdir -v $HOME/vlc_build && cd $HOME/vlc_build
git clone git://git.videolan.org/x264.git
cd $HOME/vlc_build/x264
if [ "$(uname -m)" = "x86_64" ]; then
ARCHOPTS="--enable-pic"
else
ARCHOPTS=""
fi
./configure --prefix=$HOME/vlc_build/vlcdeps/usr $ARCHOPTS
make && make install
make distclean
sudo apt-get remove liblivemedia-dev
cd $HOME/vlc_build
wget http://www.live555.com/liveMedia/public/live555-latest.tar.gz
tar xvf live555-latest.tar.gz
cd live
if [ "$(uname -m)" = "x86_64" ]; then
sed -i_bak 's/-O2 /-O2 -fPIC /' config.linux
fi
./genMakefiles linux
make
sudo mv -v $HOME/vlc_build/live /usr/lib
cd $HOME/vlc_build
svn co -r {'2009-12-11'} svn://svn.ffmpeg.org/ffmpeg/trunk ffmpeg
cd ffmpeg/libswscale
svn up -r {'2009-12-11'}
cd ..
if [ "$(uname -m)" = "x86_64" ]; then
wget http://andrews-corner.org/patches/ffmpeg_x86_64_asm.patch
patch -p1 --verbose <ffmpeg_x86_64_asm.patch
ARCHOPTS="--enable-pic"
else
ARCHOPTS=""
fi
./configure --prefix=$HOME/vlc_build/vlcdeps/usr \
$ARCHOPTS \
--enable-gpl \
--enable-version3 \
--enable-nonfree \
--enable-postproc \
--enable-pthreads \
--enable-libfaac \
--enable-libfaad \
--enable-libmp3lame \
--enable-libopencore-amrnb \
--enable-libopencore-amrwb \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffserver \
--disable-doc
make jobs=4 && make install-libs install-headers
make distclean
cd $HOME/vlc_build
wget http://libtiger.googlecode.com/files/libtiger-0.3.3.tar.gz
tar xvf libtiger-0.3.3.tar.gz
cd libtiger-0.3.3
./configure
make
sudo checkinstall --pakdir "$HOME/Desktop" --backup=no --deldoc=yes \
--pkgname libtiger --pkgversion "0.3.3" --deldesc=yes \
--delspec=yes --default
make distclean
cd $HOME/vlc_build
wget http://downloads.sourceforge.net/goom/goom-2k4-0-src.tar.gz
tar xvf goom-2k4-0-src.tar.gz
cd goom2k4-0
./configure
make
sudo checkinstall --pakdir "$HOME/Desktop" --backup=no --deldoc=yes \
--pkgname goom --pkgversion "2k4-0" --deldesc=yes \
--delspec=yes --default
make distclean
cd $HOME/vlc_build
git clone git://git.videolan.org/vlc.git --depth 1
cd vlc
./bootstrap
export PKG_CONFIG_PATH="$HOME/vlc_build/vlcdeps/usr/lib/pkgconfig"
sed -i_bak 's/Icon=vlc/Icon\=\/usr\/local\/share\/vlc\/vlc48x48\.png/' \
share/vlc.desktop
if [ ! "$(uname -m)" = "x86_64" ]; then
ARCHOPTS="--enable-loader"
else
ARCHOPTS=""
fi
./configure $ARCHOPTS \
--with-live555-tree=/usr/lib/live \
--enable-real \
--enable-realrtsp \
--enable-aa \
--enable-snapshot \
--enable-merge-ffmpeg 
make jobs=4
sudo checkinstall --pakdir "$HOME/Desktop" --backup=no --deldoc=yes \
--pkgname vlc --pkgversion "1.1.0-`date +%Y%m%d`" \
--deldesc=yes --delspec=yes --default
make distclean
mv -v share/vlc.desktop_bak share/vlc.desktop
sudo ldconfig
mkdir -pv $HOME/.local/share/vlc/lua/extensions
lftp -c "mirror --verbose \
http://jpeg.dinauz.org/VideoLAN/patches/extensions/share/lua/extensions \
$HOME/.local/share/vlc/lua/extensions"
cd $HOME/vlc_build
git clone git://git.videolan.org/vlmc.git --depth 1
cd vlmc
cmake .
make
