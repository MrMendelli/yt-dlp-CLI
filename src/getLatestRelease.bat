@ECHO OFF

REM Notes
REM The interface (argument processing) is not very flexible but it works.

REM Usage:
REM CALL getLatestRelease.bat https://github.com/yt-dlp/yt-dlp/releases/latest yt-dlp_win.zip

REM Scope locally to avoid variable name collisions
SETLOCAL

    REM Declare variables
    SET "downloadTarget="
    SET "downloadURL="
    SET "downloadDestination="
    SET "latestReleaseRedirectURL="
    SET "latestReleaseURL="

    REM Process argument defaults for numbered parameters 1 and 2
    IF [%1] == [] (
        SET "latestReleaseURL=https://github.com/yt-dlp/yt-dlp/releases/latest"
    )  ELSE (
        SET "latestReleaseURL=%1"
    )
    IF [%2] == [] (
        SET "downloadTarget=yt-dlp_win.zip"
    )  ELSE (
        SET "downloadTarget=%2"
    )

    REM Get the redirect url from the latest release url
    FOR /F "tokens=1,2* usebackq" %%a IN (`
        CURL.EXE -is %latestReleaseURL% ^| FINDSTR /r /c:"^Location"
    `) do (
        SET "latestReleaseRedirectURL=%%b"
    )

    REM Set the download 
    SET "downloadURL=%latestReleaseRedirectURL:tag=download%/%downloadTarget%"
    SET "downloadDestination=%TEMP%\%downloadTarget%"
    
    REM Show feedback to user
    ECHO Downloading %downloadURL% -^> "%downloadDestination%"

    REM Execute
    ECHO CURL.EXE %downloadURL% -s -o "%downloadDestination%"

ENDLOCAL

EXIT /B %ERRORLEVEL%