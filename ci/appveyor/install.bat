cd %APPVEYOR_BUILD_FOLDER%

echo Compiler: %COMPILER%
echo Architecture: %MSYS2_ARCH%
echo Platform: %PLATFORM%
echo MSYS2 directory: %MSYS2_DIR%
echo MSYS2 system: %MSYSTEM%
echo Bits: %BIT%

IF %COMPILER%==msys2 (
  @echo on
  SET "PATH=C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%"

  REM dependencies
  bash -lc "pacman -S --needed --noconfirm git zip base-devel mingw-w64-x86_64-autotools mingw-w64-x86_64-toolchain mingw-w64-x86_64-xpm-nox mingw-w64-x86_64-libtiff mingw-w64-x86_64-giflib mingw-w64-x86_64-libpng mingw-w64-x86_64-libjpeg-turbo mingw-w64-x86_64-librsvg mingw-w64-x86_64-libwebp mingw-w64-x86_64-lcms2 mingw-w64-x86_64-gnutls mingw-w64-x86_64-jansson mingw-w64-x86_64-libgccjit mingw-w64-x86_64-libxml2 mingw-w64-x86_64-gnutls mingw-w64-x86_64-zlib mingw-w64-x86_64-harfbuzz mingw-w64-x86_64-tree-sitter mingw-w64-x86_64-sqlite3"
)
