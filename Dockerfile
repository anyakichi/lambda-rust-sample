FROM anyakichi/lambda-rust-builder:al2 AS builder

COPY Cargo.lock Cargo.toml /build/
COPY src /build/src/
RUN chown -R builder:builder /build

WORKDIR /build
USER builder
RUN cargo build --release

FROM anyakichi/lambda-rust-builder:al2

ENV \
  GIT_REPO=https://github.com/anyakichi/lambda-rust-sample.git

COPY --from=builder /build/target/release/bootstrap /var/runtime/bootstrap
RUN chown root: /var/runtime/bootstrap
