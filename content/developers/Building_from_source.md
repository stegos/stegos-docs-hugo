+++
title = "Building from Source"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

+++

### Building on Linux and Mac

#### Requirements

* {{< code >}}Stegos{{< /code >}} requires **Rust 1.38.0-nightly (d3f8a0b5d 2019-08-04)** to build.
  The recommended way to install Rust it to use **rustup**. If you don't already have {{< code >}}rustup{{< /code >}}, you can install it like this:
  {{< highlight bash "full=true, title=get-rust.sh" >}}curl https://sh.rustup.rs -sSf | sh{{< / highlight >}}
  Make sure that these binaries are in your {{< code >}}PATH{{< /code >}}. After that, you should be able to build Stegos from the source. Use **nightly-2019-08-04** toolchain when asked.
* {{< code >}}libflint{{< /code >}} and {{< code >}}libgmp{{< /code >}} - we expect {{< code >}}libflint.a{{< /code >}} and {{< code >}}libgmp.a{{< /code >}} static libraries and headers installed in {{< code >}}/usr/local{{< /code >}}. Binaries for Linux and MacOS can be grabbed at **[https://github.com/stegos/stegos-external-libs/releases](https://github.com/stegos/stegos-external-libs/releases)**.

#### Building

Run {{< code >}}cargo build{{< /code >}} to create the main executable:

{{< highlight bash "linenos=inline" >}}
# build in release mode
$ cargo build --release
{{< / highlight >}}

This produces {{< code >}}stegos{{< /code >}} and {{< code >}}stegosd{{< /code >}} executable in the {{< code >}}./target/release{{< /code >}} subdirectory.
