# rust-s2i

**This is deprecated. Use [`rust-cross`](https://github.com/japaric/rust-cross) instead.**

[Rust](https://www.rust-lang.org) builder image and run time image
for [`s2i`](https://github.com/openshift/source-to-image/).

The images are pushed to [Dockerhub](https://hub.docker.com/r/lawliet89/rust-s2i/)  

## Dockerfiles

### Builder
 - 1.14.0, latest ([`Dockerfile`](Dockerfile))

### Runtime
 - runtime ([`Dockerfile`](runtime/Dockerfile))

### Building the image

For the Builder image, simply `docker build -t rust-s2i:1.14.0 .`.

To build the runtime image, you use `docker build -t rust-s2i:runtime runtime`

## Usage
If you want a portable Rust toolchain environment, you can simply extend your `Dockerfiles` from
`lawliet89/rust-s2i`.

The real usage comes from using `s2i` to build your Rust applications and transplant them to a lean runtime image
without the need for the Rust toolchain.

```bash
s2i build \
  /path/to/test-app \
  lawliet89/rust-s2i:1.14.0 \
  test-app \
  --runtime-image lawliet89/rust-s2i:runtime \
  -e RUST_BINARY="my_app"
```

### Build script variables

`RUST_BINARY`: This is the name of the binary to run in both the builder image and the runtime image.

### Extracting built binaries

If you would like to extract your Rust binaries, simply start a container with the image you just built,
and use `docker cp` to copy the binaries.
