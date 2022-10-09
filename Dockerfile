FROM rust:latest

COPY ./ ./

RUN apt install pkg-config -y

RUN apt install openssl -y

RUN cargo build --release

CMD ["./target/release/fitx-workload"]
