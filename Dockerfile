FROM rust:1.31
COPY ./target/release/rust-fitx /app/
WORKDIR /app/

CMD ./rust-fitx 