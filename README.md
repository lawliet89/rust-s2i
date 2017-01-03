# rust-s2i

[Rust](https://www.rust-lang.org) builder image and run time image
for [`s2i`](https://github.com/openshift/source-to-image/).

The images are pushed to [Dockerhub](https://hub.docker.com/r/lawliet89/rust-s2i/)  

This is still highly a WIP. More documentation on the way.

## Dockerfiles

### Builder
 - 1.14.0, latest ([`Dockerfile`](Dockerfile))

### Runtime
 - runtime ([`Dockerfile`](runtime/Dockerfile))

## Usage



```
s2i build /path/to/test-app lawliet89/rust-s2i:1.14.0 test-app --runtime-image lawliet89/rust-s2i:runtime -e RUST_BINARY="my_app"
```
