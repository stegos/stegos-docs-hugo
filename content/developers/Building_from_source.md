+++
title = "Building from Source"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

+++

### Building on Linux and Mac

#### Requirements

* **Stegos** requires **Rust 1.38.0-nightly (d3f8a0b5d 2019-08-04)** to build.
  The recommended way to install Rust it to use **rustup**. If you don't already have `rustup`, you can install it like this:
```bash
curl https://sh.rustup.rs -sSf | sh
```
  Make sure that these binaries are in your `PATH`. After that, you should be able to build Stegos from the source. Use **nightly-2019-08-04** toolchain when asked.
* `libflint` and `libgmp` - we expect `libflint.a` and `libgmp.a` static libraries and headers installed in `/usr/local`. Binaries for Linux and MacOS can be grabbed at **[https://github.com/stegos/stegos-external-libs/releases](https://github.com/stegos/stegos-external-libs/releases)**.

#### Building

Run `cargo build` to create the main executable:

```bash
# build in release mode
cargo build --release
```

This produces `stegos` and `stegosd` executable in the `./target/release` subdirectory.
