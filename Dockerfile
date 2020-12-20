FROM rust:1.48-buster as build

# prepare base image with dependencies
## create shell project
WORKDIR /usr/src/
RUN USER=root cargo new --bin app
WORKDIR /usr/src/app

## copy dependencies
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

## build and cache all dependencies
RUN cargo build --release

# build real app
## replace src
RUN rm src/*.rs
COPY ./src ./src

## build for release, using already compiled dependencies
RUN touch src/main.rs
RUN cargo build --release

FROM rust:1.48-slim-buster
## copy across binary
COPY --from=build /usr/src/app/target/release/rust_multi_arch /rust_multi_arch
CMD ["/rust_multi_arch"]

