FROM rust:latest

COPY ./ ./

RUN sudo apt install pkg-config -y

RUN sudo apt install openssl -y

RUN cargo build --release

CMD ["./target/release/fitx-workload"]
