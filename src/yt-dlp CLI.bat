@echo off

:: Written by Mr. Mendelli
:: GitHub: https://github.com/MrMendelli/yt-dlp-CLI

title yt-dlp CLI

md "%~dp0bin\" > nul 2>&1
move /y "ffmpeg\*.*" "bin\"
rmdir "ffmpeg" /s /q
move /y "yt-dlp\*.*" "bin\"
rmdir "yt-dlp" /s /q

:yt-dlpCheck
if exist ".\bin\yt-dlp.exe" goto :ffmpegCheck
cls & mode con cols=58 lines=3 & color 0c & echo. & echo.
set /p "UserChoice=yt-dlp.exe not found! Download now? "
if /i "%UserChoice%" equ "Y" goto :Downloadyt-dlp
if /i "%UserChoice%" equ "N" exit /b
cls & echo.
echo You must enter 'y' or 'n' to proceed... & pause > nul
goto :yt-dlpCheck

:Downloadyt-dlp
cls & mode con cols=58 lines=5 & color 0e & echo.
echo 1. Download yt-dlp_win.zip
echo 2. Extract contents to .\bin\
echo 3. Press any key to continue once installation is complete
start https://github.com/yt-dlp/yt-dlp/releases/latest/
pause > nul
goto :yt-dlpCheck

:ffmpegCheck
set "UserChoice="
if not exist ".\bin\yt-dlp.exe" goto :yt-dlpCheck
if exist ".\bin\ffmpeg.exe" goto :MainMenu
cls & mode con cols=58 lines=3 & color 0c & echo. & echo.
set /p "UserChoice=ffmpeg not found! Download now? "
if /i "%UserChoice%" equ "Y" goto :Downloadffmpeg
if /i "%UserChoice%" equ "N" exit /b
cls & echo.
echo You must enter 'y' or 'n' to proceed... & pause > nul
goto :ffmpegCheck

:Downloadffmpeg
cls & mode con cols=58 lines=5 & color 0e & echo.
echo 1. Download ffmpeg from either mirror
echo 2. Extract contents of bin to .\bin\
echo 3. Press any key to continue once installation is complete
start https://ffmpeg.org/download.html#build-windows/
pause > nul
goto :yt-dlpCheck

:MainMenu
set "ytdlp=%~dp0bin\yt-dlp.exe"
set "ffmpeg=%~dp0bin\ffmpeg.exe"
set "UserChoice="
cls & mode con cols=58 lines=13 & color cf
echo     __________________________________________________
echo    /                                                  \
echo    ^|                     Main Menu                    ^|
echo    ^|--------------------------------------------------^|
echo    ^| Download ..................................... 1 ^|
echo    ^| Search ....................................... 2 ^|
echo    ^| Update ....................................... 3 ^|
echo    ^| Run .......................................... 4 ^|
echo    ^| Help ......................................... 5 ^|
echo    \__________________________________________________/
echo.
set /p "UserChoice=Enter option: "
if /i "%UserChoice%" equ "1" goto :URL
if /i "%UserChoice%" equ "2" goto :Search
if /i "%UserChoice%" equ "3" goto :Update
if /i "%UserChoice%" equ "4" goto :RunProgram
if /i "%UserChoice%" equ "5" goto :Help
cls & color 0c & echo.
echo You must enter an option to proceed... & pause > nul
goto :MainMenu

:Help
cls
%ytdlp% --help> ".\help.txt"
if %errorlevel% equ 0 (start "" notepad "help.txt") else (echo. & pause)
goto :MainMenu

:URL
set "URL="
cls & mode con cols=140 lines=31 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|          Video / Playlist / Channel URL          ^|
echo    \__________________________________________________/
echo.
echo ^*Append multiple URLs by separating with spaces.
echo ^*Enter -r to return to previous menu.
echo.
set /p "URL=URL: "
if /i "%URL%" equ "-r" goto :MainMenu
if /i "%URL%" neq "" goto :MediaFormat
cls & color 0c & echo.
echo You must enter a URL to proceed... & pause > nul
goto :URL

:Search
set "SearchTerm="
cls & mode con cols=58 lines=9 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|                     Search                       ^|
echo    \__________________________________________________/
echo.
echo ^*Enter -r to return to previous menu.
echo.
set /p "SearchTerm=Search term: "
if /i "%SearchTerm%" equ "-r" goto :MainMenu
if /i "%SearchTerm%" neq "" goto :LookupSearch
cls & color 0c & echo.
echo You must enter a search term to proceed... & pause > nul
goto :Search

:LookupSearch
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Searching for %SearchTerm%...
echo.
%ytdlp% --ffmpeg-location=%ffmpeg% ytsearch:%SearchTerm%>"%temp%\yt-dlp Search.txt"
if %errorlevel% equ 0 (start "" notepad "%temp%\yt-dlp Search.txt") else (echo. & pause)
goto :MainMenu

:Update
cls & mode con cols=130 lines=30 & color 0e & echo.
echo Updating...
echo.
%ytdlp% -U
if %errorlevel% equ 0 (echo. & echo Update completed. & pause) else (echo. & pause)
goto :MainMenu

:RunProgram
cls
pushd ".\bin\"
start "" cmd /k
goto :MainMenu

:MediaFormat
set "MediaFormat="
cls & mode con cols=58 lines=39 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|                      Video                       ^|
echo    ^|--------------------------------------------------^|
echo    ^| Audio Video Interleave ..................... AVI ^|
echo    ^| Flash Video ................................ FLV ^|
echo    ^| Matroska Video ............................. MKV ^|
echo    ^| QuickTime  ................................. MOV ^|
echo    ^| MPEG-4 ..................................... MP4 ^|
echo    ^| WebM ...................................... WEBM ^|
echo    ^|--------------------------------------------------^|
echo    ^|                      Audio                       ^|
echo    ^|--------------------------------------------------^|
echo    ^| Advanced Audio Coding ...................... AAC ^|
echo    ^| Apple Lossless Audio Codec ................ ALAC ^|
echo    ^| Free Lossless Audio codec ................. FLAC ^|
echo    ^| MPEG-4 Audio ............................... M4A ^|
echo    ^| MPEG-1 Audio Layer III ..................... MP3 ^|
echo    ^| Opus ...................................... OPUS ^|
echo    ^| Vorbis (OGG) ............................ Vorbis ^|
echo    ^| Waveform Audio File Format ................. WAV ^|
echo    ^|--------------------------------------------------^|
echo    ^|                     Images                       ^|
echo    ^|--------------------------------------------------^|
echo    ^| Channel Icon ............................... PFP ^|
echo    ^| Thumbnail .................................. TMB ^|
echo    ^|--------------------------------------------------^|
echo    ^|                    Subtitles                     ^|
echo    ^|--------------------------------------------------^|
echo    ^| Advanced SubStation Alpha Subtitle ......... ASS ^|
echo    ^| Lyrics Subtitle ............................ LRC ^|
echo    ^| SubRip Subtitle ............................ SRT ^|
echo    ^| Web Video Text Track ....................... VTT ^|
echo    \__________________________________________________/
echo.
echo ^*Enter -r to return to previous menu.
echo.
set /p "MediaFormat=Media format: "
:: Video
if /i "%MediaFormat%" equ "-r" goto :URL
if /i "%MediaFormat%" equ "avi" goto :VideoDownloadType
if /i "%MediaFormat%" equ "flv" goto :VideoDownloadType
if /i "%MediaFormat%" equ "mkv" goto :VideoDownloadType
if /i "%MediaFormat%" equ "MOV" goto :VideoDownloadType
if /i "%MediaFormat%" equ "mp4" goto :VideoDownloadType
if /i "%MediaFormat%" equ "webm" goto :VideoDownloadType
:: Audio
if /i "%MediaFormat%" equ "aac" goto :AudioQuality
if /i "%MediaFormat%" equ "alac" goto :AudioDownloadType
if /i "%MediaFormat%" equ "flac" goto :AudioDownloadType
if /i "%MediaFormat%" equ "m4a" goto :AudioQuality
if /i "%MediaFormat%" equ "mp3" goto :AudioQuality
if /i "%MediaFormat%" equ "opus" goto :AudioQuality
if /i "%MediaFormat%" equ "vorbis" goto :AudioQuality
if /i "%MediaFormat%" equ "wav" goto :AudioDownloadType
:: Images
if /i "%MediaFormat%" equ "pfp" goto :DownloadIcon
if /i "%MediaFormat%" equ "tmb" goto :DownloadThumbnail
:: Subs
if /i "%MediaFormat%" equ "ass" goto :DownloadSubs
if /i "%MediaFormat%" equ "lrc" goto :DownloadSubs
if /i "%MediaFormat%" equ "srt" goto :DownloadSubs
if /i "%MediaFormat%" equ "vtt" goto :DownloadSubs
cls & color 0c & echo.
echo You must enter a format to proceed... & pause > nul
goto :MediaFormat

:VideoDownloadType
set "UserChoice="
cls & mode con cols=58 lines=12 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|              Video Download Structure            ^|
echo    ^|--------------------------------------------------^|
echo    ^| Single Video ................................. 1 ^|
echo    ^| Video Playlist ............................... 2 ^|
echo    \__________________________________________________/
echo.
echo ^*Enter -r to return to previous menu.
echo.
set /p "UserChoice=Download type selection: "
if /i "%UserChoice%" equ "-r" goto :MediaFormat
if /i "%UserChoice%" equ "1" set "DownloadType=%%(title)s.%%(ext)s" & goto :DownloadVideo
if /i "%UserChoice%" equ "2" set "DownloadType=%%(playlist)s/%%(playlist_index)s. %%(title)s.%%(ext)s" & goto :DownloadVideo
cls & color 0c & echo.
echo You must enter a menu option to proceed... & pause > nul
goto :VideoDownloadType

:AudioQuality
set "AudioQuality="
cls & mode con cols=58 lines=9 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|               Output Audio Quality               ^|
echo    \__________________________________________________/
echo.
echo *Highest= 0, lowest= 10
echo ^*Enter -r to return to previous menu.
echo.
set /p "AudioQuality=Audio quality (0-10): "
if /i "%AudioQuality%" equ "-r" goto :MediaFormat
if /i "%AudioQuality%" equ "0" goto :AudioDownloadType
if /i "%AudioQuality%" equ "1" goto :AudioDownloadType
if /i "%AudioQuality%" equ "2" goto :AudioDownloadType
if /i "%AudioQuality%" equ "3" goto :AudioDownloadType
if /i "%AudioQuality%" equ "4" goto :AudioDownloadType
if /i "%AudioQuality%" equ "5" goto :AudioDownloadType
if /i "%AudioQuality%" equ "6" goto :AudioDownloadType
if /i "%AudioQuality%" equ "7" goto :AudioDownloadType
if /i "%AudioQuality%" equ "8" goto :AudioDownloadType
if /i "%AudioQuality%" equ "9" goto :AudioDownloadType
if /i "%AudioQuality%" equ "10" goto :AudioDownloadType
cls & color 0c & echo.
echo You must enter a value to proceed... & pause > nul
goto :AudioQuality

:AudioDownloadType
set "UserChoice="
cls & mode con cols=58 lines=12 & color 0e
echo     __________________________________________________
echo    /                                                  \
echo    ^|              Audio Download Structure            ^|
echo    ^|--------------------------------------------------^|
echo    ^| Single Track ................................. 1 ^|
echo    ^| Track Playlist ............................... 2 ^|
echo    \__________________________________________________/
echo.
echo ^*Enter -r to return to previous menu.
echo.
set /p "UserChoice=Download type selection: "
if /i "%UserChoice%" equ "-r" goto :MediaFormat
if /i "%UserChoice%" equ "1" set "DownloadType=%%(title)s.%%(ext)s" & goto :DownloadAudio
if /i "%UserChoice%" equ "2" set "DownloadType=%%(playlist)s/%%(playlist_index)s. %%(title)s.%%(ext)s" & goto :DownloadAudio
cls & color 0c & echo.
echo You must enter a menu option to proceed... & pause > nul
goto :AudioDownloadType

:DownloadVideo
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Video download in progress...
echo.
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% --remux-video %MediaFormat% --add-metadata --embed-thumbnail --embed-chapters --embed-subs -o "%userprofile%\Videos\yt-dlp\%DownloadType%"
if %errorlevel% equ 0 (echo. & echo Download completed. & pause & start "" explorer "%userprofile%\Videos\yt-dlp") else (echo. & pause)
goto :MainMenu

:DownloadSubs
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Subtitles download in progress...
echo.
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% --skip-download --write-subs --sub-langs all --convert-subtitles %MediaFormat% -o "%userprofile%\Videos\yt-dlp\%%(title)s.%%(ext)s"
if %errorlevel% equ 0 (pause & echo. & echo Download completed. & start "" explorer "%userprofile%\Videos\yt-dlp") else (echo. & pause)
goto :MainMenu

:DownloadAudio
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Audio download in progress...
if %MediaFormat% equ "aac" goto :Lossy
if %MediaFormat% equ "alac" goto :Lossless
if %MediaFormat% equ "flac" goto :Lossless
if %MediaFormat% equ "m4a" goto :Lossy
if %MediaFormat% equ "mp3" goto :Lossy
if %MediaFormat% equ "opus" goto :Lossy
if %MediaFormat% equ "vorbis" goto :Lossy
if %MediaFormat% equ "wav" goto :Lossless

:Lossless
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% -x --add-metadata --audio-format %MediaFormat% -o "%userprofile%\Music\yt-dlp\%DownloadType%"
if %errorlevel% equ 0 (echo. & echo Download completed. & pause & start "" explorer "%userprofile%\Music\yt-dlp") else (echo. & pause)
goto :MainMenu

:Lossy
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% -x --add-metadata --audio-format %MediaFormat% --audio-quality %AudioQuality% -o "%userprofile%\Music\yt-dlp\%DownloadType%"
ren "%userprofile%\Music\yt-dlp\*.vorbis" "*.ogg"
if %errorlevel% equ 0 (echo. & echo Download completed. & pause & start "" explorer "%userprofile%\Music\yt-dlp") else (echo. & pause)
goto :MainMenu

:DownloadIcon
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Channel icon download in progress...
echo.
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% --playlist-items 0 --write-thumbnail -o "%userprofile%\Pictures\yt-dlp\%%(title)s.%%(ext)s"
if %errorlevel% equ 0 (echo. & echo Download completed. & pause & start "" explorer "%userprofile%\Pictures\yt-dlp") else (echo. & pause)
goto :MainMenu

:DownloadThumbnail
cls & mode con cols=140 lines=30 & color 0e & echo.
echo Thumbnail download in progress...
echo.
%ytdlp% --ffmpeg-location=%ffmpeg% --cookies "cookies.txt" %URL% --skip-download --write-thumbnail -o "%userprofile%\Pictures\yt-dlp\%%(title)s.%%(ext)s"
if %errorlevel% equ 0 (echo. & echo Download completed. & pause & start "" explorer "%userprofile%\Pictures\yt-dlp") else (echo. & pause)
goto :MainMenu
