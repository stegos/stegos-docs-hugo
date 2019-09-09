+++
title = "Building from Source"
head ="<label>Building from Source</label> "
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

# Creator's Display name
creatordisplayname = "Alaze"
# Creator's Email
creatoremail = ""
# LastModifier's Display name
lastmodifierdisplayname = "Alaze"
# LastModifier's Email
lastmodifieremail = ""
+++

### Building on Linux and Mac

#### Requirements

* `Stegos` requires **Rust 1.38.0-nightly (d3f8a0b5d 2019-08-04)** to build.
  The recommended way to install Rust it to use **rustup**. If you don't already have `rustup`, you can install it like this:
  {{< highlight bash "full=true, title=get-rust.sh" >}}curl https://sh.rustup.rs -sSf | sh{{< / highlight >}}
  Make sure that these binaries are in your `PATH`. After that, you should be able to build Stegos from the source. Use **nightly-2019-08-04** toolchain when asked.
* `libflint`  and `libgmp` - we expect `libflint.a` and `libgmp.a` static libraries and headers installed in `/usr/local`. Binaries for Linux and MacOS can be grabbed at **[https://github.com/stegos/stegos-external-libs/releases](https://github.com/stegos/stegos-external-libs/releases)**.

#### Building

Run `cargo build` to create the main executable:

{{< highlight bash "linenos=inline" >}}
# build in release mode
$ cargo build --release
{{< / highlight >}}

This produces `stegos` and `stegosd` executable in the `./target/release` subdirectory.
