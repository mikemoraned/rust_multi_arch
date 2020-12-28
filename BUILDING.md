# Build

## Make public (one-off)

Go to https://github.com/users/mikemoraned/packages/container/rust_multi_arch/settings and click "Make Public"

## Building and Publishing Locally 

### Building

    docker build . --platform linux/arm64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker build . --platform linux/amd64 --tag ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    
### Publish on Github Container Registry

#### login (one-off)

See https://docs.github.com/en/free-pro-team@latest/packages/guides/pushing-and-pulling-docker-images

    export CR_PAT=... # fill in ... with Personal Access Token
    echo $CR_PAT | docker login ghcr.io -u mikemoraned --password-stdin

#### publish (each time)

    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64
    docker push ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64

#### combine into single multi-arch source (each time)

    docker manifest create ghcr.io/mikemoraned/rust_multi_arch:0.1.3 ghcr.io/mikemoraned/rust_multi_arch:0.1.3-amd64 ghcr.io/mikemoraned/rust_multi_arch:0.1.3-arm64
    docker manifest push ghcr.io/mikemoraned/rust_multi_arch:0.1.3 

## Building and Publishing using Github Actions

### Setup credentials (one-off)

Similar to https://docs.github.com/en/free-pro-team@latest/packages/guides/pushing-and-pulling-docker-images you'll need to create a new Personal Access Token which has the permissions to create new container images. I suggest creating a new PAT for each repo you need. 

Go to the [repo secrets area](https://github.com/mikemoraned/rust_multi_arch/settings/secrets/actions) and create a "New repository secret" with the name `GHCR_TOKEN` and the value of the PAT from above. This will be used by the [workflow][workflow] to log in to the container registry.

### Publish on Github Container Registry

See [workflow][workflow] for details, but in summary this:
* triggers whenever anything is pushed, but only publishes when on a non-main branch or for a release
* uses a buildx-enabled multi-arch build
* uses github cache

[workflow]: .github/workflows/publish-to-ghcr.yaml
