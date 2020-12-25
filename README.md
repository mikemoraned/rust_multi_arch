# Build

    docker build . --platform linux/arm64 --tag houseofmoran/rust_multi_arch:0.1.3-arm64
    docker build . --platform linux/amd64 --tag houseofmoran/rust_multi_arch:0.1.3-amd64
    
# Publish

    docker push houseofmoran/rust_multi_arch:0.1.3-arm64
    docker push houseofmoran/rust_multi_arch:0.1.3-amd64
    
# Run

    docker run houseofmoran/rust_multi_arch:0.1.3-arm64
    docker run houseofmoran/rust_multi_arch:0.1.3-amd64

## On Arm (M1) Mac

You should see

    arch: aarch64, family: unix, os: linux

    $ docker run houseofmoran/rust_multi_arch:0.1.3-arm64
    arch: aarch64, family: unix, os: linux
    $ docker run houseofmoran/rust_multi_arch:0.1.3-amd64
    WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
    arch: x86_64, family: unix, os: linux

(above verified on a `MacBook Air (M1, 2020)`, running macOS `11.1 (20C69)` and `Docker version 20.10.1, build 831ebeae96`)

## On x86 Mac

You should see:

    $ docker run houseofmoran/rust_multi_arch:0.1.3-arm64
    arch: aarch64, family: unix, os: linux
    $ docker run houseofmoran/rust_multi_arch:0.1.3-amd64
    arch: x86_64, family: unix, os: linux

(above verified on a `MacBook Pro (Retina, 13-inch, Late 2013)`, running macOS `10.14.6 (18G6020)` and `Docker version 19.03.13, build 4484c46d9d`)