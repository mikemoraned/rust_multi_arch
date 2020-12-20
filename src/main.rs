fn main() {
    println!("arch: {}, family: {}, os: {}", std::env::consts::ARCH, std::env::consts::FAMILY, std::env::consts::OS);
}
