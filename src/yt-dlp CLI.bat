@echo off

:: Written by Mr. Mendelli
:: GitHub: https://github.com/MrMendelli/yt-dlp-CLI

md ".\bin\"
:yt-dlpCheck
if exist ".\bin\yt-dlp.exe" goto :ffmpegCheck
cls & mode con cols=58 lines=3 & title Error! & color 0c & echo.
set /p choice="yt-dlp.exe not found! Download now? "
if /i "%choice%" equ "Y" goto :Downloadyt-dlp
if /i "%choice%" equ "N" goto :EoF
cls & echo.
echo You must enter 'y' or 'n' to proceed... & pause > nul
goto :yt-dlpCheck

:Downloadyt-dlp
cls & mode con cols=58 lines=4 & title yt-dlp CLI & color 0e & echo.
echo 1. Download yt-dlp_win.zip
echo 2. Extract contents to .\bin\ and restart script.
start https://github.com/yt-dlp/yt-dlp/releases/latest/
pause > nul

:ffmpegCheck
if exist ".\bin\ffmpeg.exe" goto :MainMenu
cls & mode con cols=58 lines=3 & title Error! & color 0c & echo.
set /p choice="ffmpeg not found! Download now? "
if /i "%choice%" equ "Y" goto :Downloadffmpeg
if /i "%choice%" equ "N" goto :EoF
cls & echo.
echo You must enter 'y' or 'n' to proceed... & pause > nul
goto :ffmpegCheck

:Downloadffmpeg
cls & mode con cols=58 lines=4 & title yt-dlp CLI & color 0e & echo.
echo 1. Download ffmpeg from either mirror.
echo 2. Extract contents of bin to .\bin\ and restart script.
start https://ffmpeg.org/download.html#build-windows/
pause > nul
exit /b

:MainMenu
cls & mode con cols=58 lines=13 & title yt-dlp CLI & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                     Main Menu                    ^|
echo    ^|--------------------------------------------------^|
echo    ^| Download ..................................... 1 ^|
echo    ^| Update ....................................... 2 ^|
echo    ^| Help ......................................... 3 ^|
echo    ^| Exit ......................................... 4 ^|
echo    \__________________________________________________/
echo.
echo *Not all help topics are applicable.
set /p choice="Choose a menu option: "
if /i "%choice%" equ "1" goto :URL
if /i "%choice%" equ "2" goto :Update
if /i "%choice%" equ "3" goto :Help
if /i "%choice%" equ "4" goto :EoF
cls & title Error! & color 0c
echo You must enter a menu option to proceed... & pause > nul
goto :MainMenu

:Help
cls
".\bin\yt-dlp.exe" --help> ".\Help.txt"
start "" notepad ".\Help.txt"
goto :MainMenu

:Update
cls & mode con cols=130 lines=30 & color 0f
".\bin\yt-dlp.exe" -U
pause
start https://github.com/yt-dlp/yt-dlp/releases/latest/
goto :MainMenu

:URL
cls & mode con cols=58 lines=7 & title yt-dlp CLI & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|              Video or Playlist URL               ^|
echo    \__________________________________________________/
echo.
set /p url="URL: "
if /i "%url%" neq "" goto :DownloadType
cls & title Error! & color 0c
echo You must enter a URL to proceed... & pause > nul
goto :URL

:DownloadType
cls & mode con cols=58 lines=10 & title yt-dlp CLI & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                  Download Type                   ^|
echo    ^|--------------------------------------------------^|
echo    ^| Video ........................................ 1 ^|
echo    ^| Audio ........................................ 2 ^|
echo    \__________________________________________________/
echo.
set /p option="Choose a menu option: "
if /i "%option%" equ "1" goto :DownloadVideo
if /i "%option%" equ "2" goto :AudioFormat
cls & title Error! & color 0c
echo You must enter a menu option to proceed... & pause > nul
goto :DownloadType

:DownloadVideo
cls & mode con cols=130 lines=30 & title Video download in progress... & color 0a
".\bin\yt-dlp.exe" -o "%userprofile%\Videos\yt-dlp\%%(title)s.%%(ext)s" %url%
start "" explorer "%userprofile%\Videos\yt-dlp\"
goto :MainMenu

:Audioformat
cls & mode con cols=58 lines=16 & title yt-dlp CLI & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                Output Audio Format               ^|
echo    ^|--------------------------------------------------^|
echo    ^| Advanced Audio Coding ...................... AAC ^|
echo    ^| Apple Lossless Audio Codec ................ ALAC ^|
echo    ^| Free Lossless Audio codec ................. FLAC ^|
echo    ^| MPEG-4 Audio ............................... M4A ^|
echo    ^| MPEG-1 Audio Layer III ..................... MP3 ^|
echo    ^| Opus ...................................... OPUS ^|
echo    ^| Vorbis (OGG) ............................ Vorbus ^|
echo    ^| Waveform Audio File Format ................. WAV ^|
echo    \__________________________________________________/
echo.
set /p format="Audio format: "
if /i "%format%" equ "AAC" goto :AudioQuality
if /i "%format%" equ "ALAC" goto :AudioQuality
if /i "%format%" equ "FLAC" goto :AudioQuality
if /i "%format%" equ "M4A" goto :AudioQuality
if /i "%format%" equ "MP3" goto :AudioQuality
if /i "%format%" equ "OPUS" goto :AudioQuality
if /i "%format%" equ "Vorbis" goto :AudioQuality
if /i "%format%" equ "WAV" goto :AudioQuality
cls & title Error! & color 0c
echo You must enter a format to proceed... & pause > nul
goto :Audioformat

:AudioQuality
cls & mode con cols=58 lines=8 & title yt-dlp CLI & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|               Output Audio Quality               ^|
echo    \__________________________________________________/
echo.
echo *Highest= 0, lowest= 10
set /p quality="Audio quality (0-10): "
if /i "%quality%" equ "0" goto :DownloadAudio
if /i "%quality%" equ "1" goto :DownloadAudio
if /i "%quality%" equ "2" goto :DownloadAudio
if /i "%quality%" equ "3" goto :DownloadAudio
if /i "%quality%" equ "4" goto :DownloadAudio
if /i "%quality%" equ "5" goto :DownloadAudio
if /i "%quality%" equ "6" goto :DownloadAudio
if /i "%quality%" equ "7" goto :DownloadAudio
if /i "%quality%" equ "8" goto :DownloadAudio
if /i "%quality%" equ "9" goto :DownloadAudio
if /i "%quality%" equ "10" goto :DownloadAudio
cls & title Error! & color 0c
echo You must enter a value to proceed... & pause > nul
goto :AudioQuality

:DownloadAudio
cls & mode con cols=130 lines=30 & title Audio download in progress... & color 0a
".\bin\yt-dlp.exe" -x --audio-format %format% --audio-quality %quality% -o "%userprofile%\Music\yt-dlp\%%(title)s.%format%" %url%
rename "%userprofile%\Music\yt-dlp\*.vorbis" "*.ogg" > nul
start "" explorer "%userprofile%\Music\yt-dlp\"
goto :MainMenu
