IF %COMPILER%==msys2 (
  @echo on
  SET "PATH=C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%"
  echo "%PATH%"

  REM Copy all dependencies to installation folder
  bash -lc "pushd /c/projects/emacs-w64; ldd src/emacs.exe | grep mingw | cut -d' ' -f 3 | xargs -I {} cp {} /c/emacs-dist/bin/;"

  REM Package installation directory and all dependencies
  bash -lc "pushd /c/; zip -r /c/projects/emacs-w64/emacs-dist.zip ./emacs-dist;"
)
