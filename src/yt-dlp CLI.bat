@echo off

:Noyt-dlp
md ".\bin\"
if exist ".\bin\yt-dlp.exe" goto :MainMenu
cls & mode con cols=58 lines=3 & title Error! & color 0c & echo.
set /p choice="youtube-dl.exe not found! Download now? "
if /i "%choice%" equ "Y" goto :Download
if /i "%choice%" equ "N" goto :EoF
cls & echo.
echo You must enter 'y' or 'n' to proceed... & pause > nul
goto :Noyt-dlp

:Download
cls & mode con cols=58 lines=4 & title Download yt-dlp & color 0e & echo.
echo 1. Download yt-dlp_win.zip
echo 2. Extract contents to .\bin\ and restart script.
start https://github.com/yt-dlp/yt-dlp/releases/latest/
pause > nul
exit /b

:MainMenu
cls & mode con cols=58 lines=12 & title Main Menu & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                    yt-dlp CLI                    ^|
echo    ^|--------------------------------------------------^|
echo    ^| Download ..................................... D ^|
echo    ^| Update ....................................... U ^|
echo    ^| Help (not all are applicable) ................ H ^|
echo    ^| Exit ......................................... E ^|
echo    \__________________________________________________/
echo.
set /p choice="Choose a menu option: "
if /i "%choice%" equ "D" goto :URL
if /i "%choice%" equ "U" goto :Update
if /i "%choice%" equ "H" goto :Help
if /i "%choice%" equ "E" goto :EoF
cls & title Error! & color 0c
echo You must enter a menu option to proceed... & pause > nul
goto :MainMenu

:Help
cls
".\bin\yt-dlp.exe" --help> ".\Help.txt"
start "" notepad ".\Help.txt"
goto :MainMenu

:Update
cls
".\bin\yt-dlp.exe" -U
pause
start https://github.com/yt-dlp/yt-dlp/releases/latest/
goto :MainMenu

:URL
cls & mode con cols=58 lines=7 & title Enter URL & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                    yt-dlp CLI                    ^|
echo    \__________________________________________________/
echo.
set /p url="URL: "
if /i "%url%" neq "" goto :DownloadType
cls & title Error! & color 0c
echo You must enter a URL to proceed... & pause > nul
goto :URL

:DownloadType
cls & mode con cols=58 lines=10 & title Download Type & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                    yt-dlp CLI                    ^|
echo    ^|--------------------------------------------------^|
echo    ^| Video ........................................ V ^|
echo    ^| Audio ........................................ A ^|
echo    \__________________________________________________/
echo.
set /p option="Choose a menu option: "
if /i "%option%" equ "V" goto :DownloadVideo
if /i "%option%" equ "A" goto :AudioFormat
cls & title Error! & color 0c
echo You must enter a menu option to proceed... & pause > nul
goto :DownloadType

:DownloadVideo
cls & color 0a
echo Video download in progress...
".\bin\yt-dlp.exe" -f best -ci -o "%userprofile%\Videos\yt-dlp\%%(title)s.%%(ext)s" %url%
start "" explorer "%userprofile%\Videos\yt-dlp\"
goto :URL

:Audioformat
cls & mode con cols=58 lines=16 & title Output Audio Format & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                    yt-dlp CLI                    ^|
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
cls & mode con cols=58 lines=7 & title Output Audio Quality & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                    yt-dlp CLI                    ^|
echo    \__________________________________________________/
echo.
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
cls & color 0a
title Audio download in progress...
".\bin\yt-dlp.exe" -x --audio-format %format% --audio-quality %quality% -o "%userprofile%\Music\yt-dlp\%%(title)s.%format%" %url%
rename "%userprofile%\Music\yt-dlp\*.vorbis" "*.ogg" > nul
start "" explorer "%userprofile%\Music\yt-dlp\"
goto :URL
