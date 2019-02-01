unzip DualBootPatcher-9.3.0-win32.zip
rm DualBootPatcher-9.3.0-win32.zip

pushd DualBootPatcher-9.3.0-win32

dlls=(
    libwebpdemux-2.dll
    libwebp-7.dll
    libtiff-5.dll
    Qt5Svg.dll
    libjpeg-62.dll
    libjasper-4.dll
    iconv.dll
    libarchive-13.dll
    libbz2-1.dll
    libcrypto-10.dll
    libfreetype-6.dll
    libgcc_s_sjlj-1.dll
    libglib-2.0-0.dll
    libharfbuzz-0.dll
    libintl-8.dll
    liblz4.dll
    liblzma-5.dll
    libpcre2-16-0.dll
    libpcre16-0.dll
    libpcre-1.dll
    libpng16-16.dll
    libssp-0.dll
    libstdc++-6.dll
    libwinpthread-1.dll
    libxml2-2.dll
    Qt5Core.dll
    Qt5Gui.dll
    Qt5Widgets.dll
    zlib1.dll
)

for dll in "${dlls[@]}"; do
cp /usr/i686-w64-mingw32/sys-root/mingw/bin/${dll} .
done

# Qt Windows plugin
mkdir platforms/
cp /usr/i686-w64-mingw32/sys-root/mingw/lib/qt5/plugins/platforms/qwindows.dll platforms/

# Optionally, compress executables and libraries (excluding qwindows plugin)
upx --lzma *.exe *.dll

popd
zip -r DualBootPatcher-9.3.0-win32.zip DualBootPatcher-9.3.0-win32
