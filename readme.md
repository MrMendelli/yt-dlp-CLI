# yt-dlp CLI

## About
This is a minimal CLI frontend that simplifies use of yt-dlp for video and audio with functionality for all supported output audio formats and qualities.

## Issues
- Even if the yt-dlp build is up-to-date, leaving the window still opens the GitHub page due to batch limitations
- ffmpeg is a requirement for downloading videos as audio in newer yt-dlp builds, a fix was implemented but there is no current implementation of checking PATH so a relative path check is used instead
- Window does not rescale correctly when changed if the window is minimized between actions
- Only developed for Windows _(*for now)_

## Contributing
Feel free to submit a PR, but please comment code when doing so. This is for clarity as batch has a range of use syntax and limitations that are too vast to account for so some things may seem unclear on first glance. Not all yt-dlp features are implemented, it is undecided if more will be added. Requests will not be taken, but PRs will be considered
