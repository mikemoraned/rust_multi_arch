# Build

    docker build . --platform linux/arm64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker build . --platform linux/amd64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    
# Publish on Github Container Registry

## login (one-off)

See https://docs.github.com/en/free-pro-team@latest/packages/guides/pushing-and-pulling-docker-images

    export CR_PAT=... # fill in ... with Personal Access Token
    echo $CR_PAT | docker login ghcr.io -u mikemoraned --password-stdin

## publish (each time)

    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64

## combine into single multi-arch source (each time)

    docker manifest create ghcr.io/mikemoraned/rust_multi_arch:0.1.3 ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64 ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker manifest push ghcr.io/mikemoraned/rust_multi_arch:0.1.3 

## make public (one-off)

Go to https://github.com/users/mikemoraned/packages/container/rust_multi_arch/settings and click "Make Public"

