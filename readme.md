# yt-dlp CLI

## Disclaimer

_This utility **does not** include [yt-dlp](https://github.com/yt-dlp/yt-dlp) or [ffmpeg](https://ffmpeg.org/), but it will prompt you if either is not found with instructions._

## Introduction

This tool aims to be a CLI frontend that simplifies the downloading of video or audio for [yt-dlp](https://github.com/yt-dlp/yt-dlp) with functionality for all supported output audio formats and qualities. This works for individual videos or playlists. When downloads are completed, the output folder is made and opened upon completion.

## Use

Simply download the [latest release](https://github.com/MrMendelli/yt-dlp-CLI/releases/latest) and extract to a desired location. It is not recommended to extract to a UAC-protected parent directory. Once yt-dlp and ffmpeg are downloaded and extracted, run the script and follow the prompts.

I use [Export Cookies by Rotem Dan](https://addons.mozilla.org/en-US/firefox/addon/export-cookies-txt/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) for extracting browser cookies. Place `cookies.txt` in the working directory, cookies will automatically be loaded when downloading a video.

## Issues

- Even if the yt-dlp build is up-to-date, leaving the window still opens the GitHub page due to batch limitations
- ffmpeg is a requirement for downloading videos as audio in newer yt-dlp builds, a fix was implemented but there is no current implementation of checking PATH so a relative path check is used instead
- Not all base features are implemented, it is undecided if more will be added. Requests will not be taken, but PRs will be considered
- An unideal method needed to be used for downloading Vorbis audio, upon completion a command is run to change the extensions of downloaded Vorbis outfiles due to batch limitations
- Window does not rescale correctly when changed if the window is minimized between actions
- Only Windows support is planned at the time of this readme's submission
- AVI: Downloads as multiple files (`<VideoTitle>.mp4`/`<VideoTitle>.webm`/`<VideoTitle>.avi`)
- FLV: Downloads as multiple files (`<VideoTitle>.mp4`/`<VideoTitle>.webm`/`<VideoTitle>.flv`)
- MOV: Downloads as multiple files (`<VideoTitle>.mp4`/`<VideoTitle>.webm`/`<VideoTitle>.mov`)
- Webm: Downloads as multiple files (*.f136.mp4/*.f251.webm/*.webm)
- AAC: Downloads as *.m4a
- ALAC: Downloads as *.m4a

## Contributing

Feel free to submit a PR, but please comment code when doing so. This is for clarity as batch has a range of use syntax and limitations that are too vast to account for so some things may seem unclear on first glance. 

