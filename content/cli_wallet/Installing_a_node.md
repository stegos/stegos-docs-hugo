+++
title = "Installing a node"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=3
+++

In this section we explain how to install Stegos Node (stegosd) and Stegos Command-Line Client (stegos) on your server.

**Prerequisites:**

* Linux host (any distro) OR
* macOS host OR
* Docker-enabled host.

{{% notice note %}}This instruction is about running Stegos Node server using command-line interface. If you need a desktop application, please see "Installing a Desktop App".{{% /notice %}}

### Installing on Linux

For production purposes, we recommend official binaries from GitHub Release page. These binaries have been tested on 64-bit versions of Ubuntu 18.04 "Bionic", Debian 11 "Stretch" and Fedora 30. Other Linux distros should work as well.

#### Using Pre-built Binaries

Download the latest version of {{< code >}}stegosd{{< /code >}} and {{< code >}}stegos{{< /code >}} binaries from [**GitHub Releases**](https://github.com/stegos/stegos/releases)
```bash
curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegosd-linux-x64 -o stegosd
curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegos-linux-x64 -o stegos
chmod a+x stegosd stegos
./stegosd --version
./stegos --version
```

The script above will download `stegosd` (Node) and `stegos` (CLI) binaries from [**GitHub Releases**](https://github.com/stegos/stegos/releases), change file permissions to "Executable" and print Node's version:

```bash
yourname@linux:~$ curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegosd-linux-x64 -o stegosd
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   608    0   608    0     0   1859      0 --:--:-- --:--:-- --:--:--  1859
100 22.0M  100 22.0M    0     0  5996k      0  0:00:03  0:00:03 --:--:-- 7197k
you@linux:~$ curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegos-linux-x64 -o stegos
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   607    0   607    0     0   1833      0 --:--:-- --:--:-- --:--:--  1833
100 6022k  100 6022k    0     0  3033k      0  0:00:01  0:00:01 --:--:-- 5435k
yourname@linux:~$ chmod a+x stegosd stegos
yourname@linux:~$ ./stegosd --version
Stegos Node 1.1.0 (07ef602 2019-11-04)
yourname@linux:~$ ./stegos --version
Stegos CLI 1.1.0 (07ef602 2019-11-04)
```

Your Node has been downloaded and installed successfully.
If you see "undefined symbol" message or other errors - please file [an issue on GitHub.](https://github.com/stegos/stegos/issues). 

#### From Source

See **[Building from Source]({{< ref "/developers/Building_from_source.md">}})** page.
___

### Installing on Mac


##### Using Pre-Built binaries

Download the latest version of `stegosd` and `stegos` binaries from [**GitHub Releases**](https://github.com/stegos/stegos/releases)

```bash
curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegosd-
macos-x64 -o stegosd
curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegos-macos-x64 -o stegos
chmod a+x stegosd stegos
./stegosd --version
./stegos --version
```

The script above will download `stegosd` binary from [**GitHub Releases**](https://github.com/stegos/stegos/releases), change file permissions to "Executable" and print Node's version:

```bash
yourname@mac:~$ curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegosd-macos-x64 -o stegosd
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   608    0   608    0     0   1859      0 --:--:-- --:--:-- --:--:--  1859
100 22.0M  100 22.0M    0     0  5996k      0  0:00:03  0:00:03 --:--:-- 7197k
you@linux:~$ curl -L https://github.com/stegos/stegos/releases/download/v1.1/stegos-macos-x64 -o stegos
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   607    0   607    0     0   1833      0 --:--:-- --:--:-- --:--:--  1833
100 6022k  100 6022k    0     0  3033k      0  0:00:01  0:00:01 --:--:-- 5435k
yourname@mac:~$ chmod a+x stegosd stegos
yourname@mac:~$ ./stegosd --version
Stegos Node 1.1.0 (07ef602 2019-11-04)
yourname@mac:~$ ./stegos --version
Stegos CLI 1.1.0 (07ef602 2019-11-04)
```

Your Node has been downloaded and installed successfully.
If you see "undefined symbol" message or other errors - please file an issue on GitHub.

#### From Source

See **[Building from Source]({{< ref "/developers/Building_from_source.md">}})** page.
___

### Installing in Docker

Use {{< code >}}stegos/stegos{{< /code >}} image:

{{< highlight bash >}}
docker run -v $PWD:/stegos:/data stegos/stegos
{{< / highlight >}}
___

### Installing on Windows

#### Using WSL

Please follow Linux installation instructions [**above.**]({{< relref "/Installing_a_node.md#installing-on-linux">}})

#### Using Pre-Built Binaries

Download the latest version of `stegosd` and `stegos` binaries from [**GitHub Releases**](https://github.com/stegos/stegos/releases):

- https://github.com/stegos/stegos/releases/download/v1.1/stegos-win-x64.zip
- https://github.com/stegos/stegos/releases/download/v1.1/stegosd-win-x64.zip

Unpack zip archives. Your Node has been downloaded and installed successfully.

#### From Source

See **[Building from Source]({{< ref "/developers/Building_from_source.md">}})** page.
