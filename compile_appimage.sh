if [ ! -e "appimagetool.AppImage" ]
then
    wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
    mv appimagetool-x86_64.AppImage appimagetool.AppImage
fi

chmod u+x appimagetool.AppImage

mkdir -p AppDir/usr/bin
echo "[Desktop Entry]
Type=Application
Name=Motusolve
Exec=motusolve
Icon=logo
Categories=Utility;" > AppDir/motusolve.desktop

echo '#!/bin/bash
exec $APPDIR/usr/bin/motusolve' > AppDir/AppRun
chmod u+x AppDir/AppRun

cp dist/motusolve/motusolve-linux_x64 AppDir/usr/bin/motusolve
cp dist/motusolve/resources.neu AppDir/usr/bin

cp vue-src/public/logo.png AppDir

./appimagetool.AppImage AppDir motusolve
chmod u+x motusolve