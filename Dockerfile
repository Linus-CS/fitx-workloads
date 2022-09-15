FROM rust:1.31
COPY ./target/release/fitx-workload /app/
WORKDIR /app/

CMD ./fitx-workload