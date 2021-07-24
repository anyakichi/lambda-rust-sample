# lambda-rust-sample

This is a rust application sample that works in AWS Lambda.

You can build it using [docker-buildenv](https://github.com/anyakichi/docker-buildenv).

```
$ mkdir lambda rust-sample-1 && cd $_
$ din anyakichi/lambda-rust-sample-builder:main
[builder@rust-sample-1 build]$ extract
[builder@rust-sample-1 build]$ setup
[builder@rust-sample-1 lambda-rust-sample]$ build
[builder@rust-sample-1 lambda-rust-sample]$ package
```

You can share some directories with your host machine.

```
$ din \
    -e CARGO_HOME=/cargo -v $HOME/.cargo:/cargo \
    -v $HOME/.aws:/home/builder/.aws:ro \
    anyakichi/lambda-rust-sample-builder:main
```

Upload the application to your Lambda environment.

```
[builder@rust-sample-1 lambda-rust-sample]$ update

or use aws command directly

[builder@rust-sample-1 lambda-rust-sample]$ aws lambda update-function-code \
    --function-name <function-name> --zip-file fileb://lambda-rust-sample.zip
```

See [docker-lambda-rust-builder](https://github.com/anyakichi/docker-lambda-rust-builder) for more information.
