## 10/12/24
### Major Update
```diff
+ Added thumbnail embedding
+ Added chapter embedding
+ Added metadata embedding
* Implemtnted previous menu return functionality
```

## 10/11/24
### Moderate Update
```diff
+ Improved error handling
 *Utilizes errorlevel to determine if execution proceeds or pauses.
```
* Special thanks to Rhyknowscerious on GitHub and [io-oi on Super User](https://superuser.com/a/1857954/689784).

## 09/13/24
### Minor Update
```diff
* changelog correction
```
### Bugfix
```diff
+ Added changelog
+ Addressed [issue #3](https://github.com/MrMendelli/yt-dlp-CLI/issues/3)
```

## 06/02/2024
### Major Update
```diff
+ Merge [PR #2](https://github.com/MrMendelli/yt-dlp-CLI/pull/2)
```

## 06/01/2024
### Minor Update
```diff
* Corrected subtitle download path error
```

### Minor Update
```diff
* Corrected UI typo
```

### Minor Update
```diff
* UI and path changes for subtitles
```

### Major Update
```diff
+ SRT, VTT, ASS and LRC subtitle download support added
```

## 04/28/2024
### Minor Update
```diff
* Moved script file back to /src/
```

### Major Update
```diff
+ Cookies support added
 * See readme.md for additional information
```

## 
### Major Update
```diff
+ Added the ability to download channel images and video thumbnails as image files
 *Special thanks to u/weird from the r/youtubedl
* Changed dependency paths
 *ffmpeg and yt-dlp now use separate folders
* Additional UI changes
```

## 02/29/2024
### Minor Update
```diff
* Video and audio format options have been consolidated into one menu
```

## 02/08/2024
### Major Update
```diff
+ MP4, MKV, and WebM download support added
+ A new option menu has been added similar to that of audio formats for video downloading
```

## 12/07/2023
### Minor Update
```diff
* Corrected typos and readme grammar mistakes.
```

## 09/17/2022
### Minor Update
```diff
- Removed a redundant readme tip for the repository copy
```

### New Issue
```diff
+ New issue identified
 * Window does not rescale correctly when changed if the window is minimized between actions
```

### Major Update
```diff
+ The script no longer needs to be re-ran after downloading and installing dependencies. Checks will fail and repeat until needed files are located.
```

### Minor Update
```diff
+ Added a fallback check for yt-dlp to prevent incorrect fallthrough
```

### Minor Update
```diff
* Changed the error message for missing yt-dlp to print the correct file name.
```

### Bugfix
```diff
+ Corrected bad fallthrough on yt-dlp & ffmpeg checks for downloads prompts.
```

### Minor Update
```diff
* Updated readme
```

### Bugfix
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
### Minor Update
* Corrected some minor grammatical and cosmetic errors

### Initial Commit
* Getting things started

