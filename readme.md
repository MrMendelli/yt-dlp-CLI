# yt-dlp CLI

## Disclaimer

_This utility **does not** include [yt-dlp](https://github.com/yt-dlp/yt-dlp), but it will prompt you if it is not found with instructions._

## Introduction

This is a simplistic CLI frontend that simplifies the downloading of video or audio for with functionality for all supported output audio formats and qualities. This works for individual videos or playlists. When downloads are completed, the output folder is made and opened upon completion.

## Use

Simply download the [latest release](https://github.com/MrMendelli/yt-dlp-CLI/releases/latest) and extract to a desired location. It is not recommended to extract to a UAC-protected parent directory. Once yt-dlp is downloaded and extracted, run the script and follow the prompts.

## Issues

- Not all base features are implemented, it is undecided if more will be added. Requests will not be taken, but PRs will be considered.
- A hacky method needed to be used for downloading audio as Vorbis, upon completion a command is ran to change the extensions of downloaded Vorbis outfiles. This stems from batch limitations.
- Only Windows support is planned at the time of this readme's submission.

## Contributing

Feel free to submit a PR, but please comment code when doing so. This is for clarity as batch has a range of use syntax and limitations that are too vast to account for so some things may seem unclear on first glance. 

<sup>Reading this in Notepad? Try [Typora](https://typora.io/).</sup>

