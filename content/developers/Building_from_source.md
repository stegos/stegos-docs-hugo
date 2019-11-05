+++
title = "Building from Source"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

+++

## Quick Start

Please use `./ci-scripts/build.sh` to install all dependencies and compile 
`stegos` and `stegosd` executables:

```bash
git clone https://github.com/stegos/stegos.git
cd stegos
./ci-script/build.sh
```

Produced executables will be available in the `./target/release` subdirectory.

Supported platforms:

- Ubuntu 18.04 "Bionic"
- Debian 10 "Booster"
- Fedora 30 / 31
- Windows Server 2019
- macOS 10.15 "Catalina"
- Android 5.0 "Lollipop"

Other platforms may work as well, but not tested. See platform-specific notes below.

## Windows Notes

On Windows please install MinGW toolchain first by running `./win/install_deps.bat`.

## macOS Notes

On macOS please install "Xcode Command Line Tools" first by running `xcode-select --install`
or manually from Xcode menu.

## Android Notes

Please use Ubuntu/Debian as a host system to build Android binaries.
Running Android SDK/NDK on Windows or macOS is not supported.

To create Android binaries, please invoke `build.sh` with the following arguments:

```
WITH_ANDROID=1 ./ci-scripts/build.sh release android-aarch64
WITH_ANDROID=1 ./ci-scripts/build.sh release android-x86_64
```

This script produces experimental native Android binaries (not an APK). 
Compiled binaries can be started via `adb shell` or via Termux Application.
The full-featured GUI application (.apk) is not yet available.