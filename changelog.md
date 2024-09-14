## 09/13/24
### Minor Update _([`0f59dd5`](https://github.com/MrMendelli/yt-dlp-CLI/commit/0f59dd596d49cee59193db1293aaf996a66d4478))_
* changelog correction

### Bugfix _([`4be58c8`](https://github.com/MrMendelli/yt-dlp-CLI/commit/4be58c826de42b9f3d06fabaedfcb14f8f895ac5))_
```diff
+ Added changelog
+ Fixed issue #3
 * https://github.com/MrMendelli/yt-dlp-CLI/issues/3
```

## 06/02/2024
### Major Update _([`5ccd054`](https://github.com/MrMendelli/yt-dlp-CLI/commit/5ccd054a41e6bd753a5ce5136ab2778927d298f1))_
```diff
+ Merge PR #2
 * https://github.com/MrMendelli/yt-dlp-CLI/pull/2
```

## 06/01/2024
### Minor Update _([`7948209`](https://github.com/MrMendelli/yt-dlp-CLI/commit/7948209e8c64bd0dbeed0da96164571a9ff6f771))_
```diff
* Corrected subtitle download path error
```

### Minor Update _([`2cefa84`](https://github.com/MrMendelli/yt-dlp-CLI/commit/2cefa8437bce35dacd2c78aa4fd1fde82d0fdb80))_
```diff
* Corrected UI typo
```

### Minor Update _([`66560ff`](https://github.com/MrMendelli/yt-dlp-CLI/commit/66560ff37fa675a42f798ef9d94b6b383c8a8071))_
```diff
* UI and path changes for subtitles
```

### Major Update _([`c2f066d`](https://github.com/MrMendelli/yt-dlp-CLI/commit/c2f066dc045d7619a92a5df2a47070c74ed2740d))_
```diff
+ SRT, VTT, ASS and LRC subtitle download support added
```

## 04/28/2024
### Minor Update _([`42740f8`](https://github.com/MrMendelli/yt-dlp-CLI/commit/42740f8091ec15f67244edfdc254d27c97c2dbf0))_
```diff
* Moved script file back to /src/
```

### Major Update _([`c26ede8`](https://github.com/MrMendelli/yt-dlp-CLI/commit/c26ede8b1a4da894c778fd8a609d4d808aa7f1b1))_
```diff
+ Cookies support added
 * See readme.md for more information
```

## 
### Major Update _([`9c2b72a`](https://github.com/MrMendelli/yt-dlp-CLI/commit/9c2b72a72d1bac31da99115cd1c9e5cdb8e67d99))_
```diff
+ Added the ability to download channel images and video thumbnails as image files
 *Special thanks to u/weird from the r/youtubedl
* Changed dependency paths
 *ffmpeg and yt-dlp now use separate folders
* Additional UI changes
```

## 02/29/2024
### Minor Update _([`9d93b9b`](https://github.com/MrMendelli/yt-dlp-CLI/commit/9d93b9b3d92d55c3d14f2df199095fca67beed60))_
```diff
* Video and audio format options have been consolidated into one menu
```

## 02/08/2024
### Major Update _([`4b3b9ba`](https://github.com/MrMendelli/yt-dlp-CLI/commit/4b3b9ba806262d2165ad371dfc435955c1497e15))_
```diff
+ MP4, MKV, and WebM download support added
+ A new option menu has been added similar to that of audio formats for video downloading
```

## 12/07/2023
### Minor Update _([`1af6017`](https://github.com/MrMendelli/yt-dlp-CLI/commit/1af60178e4c605c94a108a567813d490f7879543))_
```diff
* Corrected typos and readme grammar mistakes.
```

## 09/17/2022
### Minor Update _([`fa9eed9`](https://github.com/MrMendelli/yt-dlp-CLI/commit/fa9eed9e8f4e8821c37c1cf8af3364c58e1f62a1))_
```diff
- Removed a redundant readme tip for the repository copy
```

### New Issue _([`7ca53ad`](https://github.com/MrMendelli/yt-dlp-CLI/commit/7ca53adf186cbf046a8e96ac796f132e41acd0c8))_
```diff
+ New issue identified
 * Window does not rescale correctly when changed if the window is minimized between actions
```

### Major Update _([`8023d86`](https://github.com/MrMendelli/yt-dlp-CLI/commit/8023d8691e61df490826f3180bf89a3fa9f85169))_
```diff
+ The script no longer needs to be re-ran after downloading and installing dependencies. Checks will fail and repeat until needed files are located.
```

### Minor Update _([`59c040f`](https://github.com/MrMendelli/yt-dlp-CLI/commit/59c040f0b6dc3217f60c03fb5d047db932e1c1b0))_
```diff
+ Added a fallback check for yt-dlp to prevent incorrect fallthrough
```

### Minor Update _([`f07ec22`](https://github.com/MrMendelli/yt-dlp-CLI/commit/f07ec22176e2ccbaca017fafaea5fb45b438b499))_
```diff
* Changed the error message for missing yt-dlp to print the correct file name.
```

### Bugfix _([`da720da`](https://github.com/MrMendelli/yt-dlp-CLI/commit/da720dad4e689b2289e4061f058498335c5cf244))_
```diff
+ Corrected bad fallthrough on yt-dlp & ffmpeg checks for downloads prompts.
```

### Minor Update _([`4b13f62`](https://github.com/MrMendelli/yt-dlp-CLI/commit/4b13f624353778a3a666755497262356144bea84))_
```diff
* Updated readme
```

### Bugfix _([`74f536a`](https://github.com/MrMendelli/yt-dlp-CLI/commit/74f536a2497e10778dc148eea9d8da13dedf03f5))_
```diff
+ Fixed a major issue when downloading videos as audio wth newer yt-dlp builds
 * ffmpeg must now be manually downloaded and installed
- Changed default video output commands (removed redundancies)
* Reordered window and menu titles to be more clear
* Changed behavior after download completion, returns to the main menu now
* Fixed some minor code mistakes
* Changed downoad progress window size for visual clarity
* Reworked menu options.
```

## 09/16/2022
### Minor Update _([`bd5fb89`](https://github.com/MrMendelli/yt-dlp-CLI/commit/bd5fb8908adc02663150edb05a65c50bd7c2870c))_
* Corrected some minor grammatical and cosmetic errors

### Initial Commit _([`46de924`](https://github.com/MrMendelli/yt-dlp-CLI/commit/46de924ecf5a93a91a22785fd6675c259cd605f6))_
* Getting things started

