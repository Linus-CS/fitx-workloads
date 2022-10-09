FROM rust:latest

COPY ./ ./

CMD ["./target/release/fitx-workload"]
