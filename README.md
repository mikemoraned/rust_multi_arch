# Build

    docker build . --platform linux/arm64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker build . --platform linux/amd64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    
# Publish on Github Container Registry

## login

See https://docs.github.com/en/free-pro-team@latest/packages/guides/pushing-and-pulling-docker-images

    export CR_PAT=... # fill in ... with Personal Access Token
    echo $CR_PAT | docker login ghcr.io -u mikemoraned --password-stdin

## publish

    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64

## make public

Go to https://github.com/users/mikemoraned/packages/container/rust_multi_arch/settings and click "Make Public"

# Run

    docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64

## On Arm (M1) Mac

You should see

    arch: aarch64, family: unix, os: linux

    $ docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    arch: aarch64, family: unix, os: linux
    $ docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
    arch: x86_64, family: unix, os: linux

(above verified on a `MacBook Air (M1, 2020)`, running macOS `11.1 (20C69)` and `Docker version 20.10.1, build 831ebeae96`)

## On x86 Mac

You should see:

    $ docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    arch: aarch64, family: unix, os: linux
    $ docker run ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    arch: x86_64, family: unix, os: linux

(above verified on a `MacBook Pro (Retina, 13-inch, Late 2013)`, running macOS `10.14.6 (18G6020)` and `Docker version 19.03.13, build 4484c46d9d`)