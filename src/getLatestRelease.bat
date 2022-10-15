@ECHO OFF

REM Notes
REM The interface (argument processing) is not very flexible but it works.

REM Usage:
REM CALL getLatestRelease.bat https://github.com/yt-dlp/yt-dlp/releases/latest yt-dlp_win.zip "%userprofile%\Downloads"

REM Scope locally to avoid variable name collisions
SETLOCAL ENABLEDELAYEDEXPANSION

    REM Declare variables
    SET "downloadSourceURL="
    SET "downloadSourceFullName="
    SET "downloadDestinationFolder="
    SET "downloadDestinationFullName="
    SET "targetFileName="
    SET "latestReleaseRedirectURL="
    SET "latestReleaseURL="

    REM Process argument defaults for numbered parameters
    IF [%1] == [] (
        <NUL SET /P "=getLatestRelease.bat: setting default value for latestReleaseURL: "
        SET "latestReleaseURL=https://github.com/yt-dlp/yt-dlp/releases/latest"
        ECHO "!latestReleaseURL!"
    )  ELSE (
        SET "latestReleaseURL=%1"
    )
    IF [%2] == [] (
        <NUL SET /P "=getLatestRelease.bat: setting default value for targetFileName: "
        SET "targetFileName=yt-dlp_win.zip"
        ECHO "!targetFileName!"
    )  ELSE (
        SET "targetFileName=%2"
    )
    IF [%3] == [] (
        <NUL SET /P "=getLatestRelease.bat: setting default value for downloadDestinationFolder: "
        SET "downloadDestinationFolder=%userprofile%\Downloads"
        ECHO "!downloadDestinationFolder!"
    ) ELSE (
        SET "downloadDestinationFolder=%3"
    )

    REM Get the redirect url from the latest release url
    FOR /F "tokens=1,2* usebackq" %%a IN (`
        CURL.EXE -is %latestReleaseURL:"=% ^| FINDSTR /r /c:"^Location"
    `) do (
        SET "latestReleaseRedirectURL=%%b"
    )

    REM Set the latest download URL (just the page, not the file)
    SET "downloadSourceURL=%latestReleaseRedirectURL:tag=download%"

    REM Set full url to the downloadable file
    SET "downloadSourceFullName=%downloadSourceURL:"=%/%targetFileName:"=%"

    REM Set full destination filename
    SET "downloadDestinationFullName=%downloadDestinationFolder:"=%\%targetFileName:"=%"
        
    REM Perform the download
    ECHO Downloading "%downloadSourceFullName%" -^> "%downloadDestinationFullName%"...
    IF NOT EXIST "%downloadDestinationFullName%" (
        CURL.EXE --location --output "%downloadDestinationFullName%" "%downloadSourceFullName%" && (
            ECHO Download complete.
        ) || (
            ECHO Download failed.
            EXIT /B %ERRORLEVEL%
        )
    ) ELSE (
        ECHO Already downloaded "%downloadDestinationFullName%"
    )
    
    REM Extract to .\bin
    ECHO Creating directory ".\bin"
    IF NOT EXIST ".\bin" (
        MKDIR ".\bin" || (
            ECHO Could not create ".\bin"
            EXIT /B %ERRORLEVEL%
        )
    ) ELSE (
        ECHO ".\bin" already exists
    )
    
    REM bsdtar officially added to Windows 10 and other Win OS 
    REM https://learn.microsoft.com/en-us/virtualization/community/team-blog/2017/20171219-tar-and-curl-come-to-windows
    ECHO Extracting "%downloadDestinationFullName%" -^> ".\bin"...
    tar -xf "%downloadDestinationFullName%" -C ".\bin" && (
        ECHO Extraction complete.
    ) || (
        ECHO Could not extract "%downloadDestinFullName%" (
        EXIT /B %ERRORLEVEL%
    )

    REM Prompt user to cleanup the download
    <NUL SET /P "=Deleting "
    DEL /P "%downloadDestinationFullName%"

ENDLOCAL DISABLEDELAYEDEXPANSION

EXIT /B %ERRORLEVEL%