FROM rust:latest

COPY ./ ./

RUN apt install pkg-config -y

RUN apt install libssl-dev -y

RUN cargo build --release

CMD ["./target/release/fitx-workload"]
