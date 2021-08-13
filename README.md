# lambda-rust-sample

This is a rust application sample that works in AWS Lambda.

You can build it using [docker-buildenv](https://github.com/anyakichi/docker-buildenv).

```
$ mkdir lambda-rust-sample-1 && cd $_
$ din anyakichi/lambda-rust-sample:main
[builder@lambda-rust-sample-1 build]$ extract
[builder@lambda-rust-sample-1 build]$ setup
[builder@lambda-rust-sample-1 lambda-rust-sample]$ build
[builder@lambda-rust-sample-1 lambda-rust-sample]$ package
```

You can share some directories with your host machine.

```
$ din \
    -e CARGO_HOME=/cargo -v $HOME/.cargo:/cargo \
    -v $HOME/.aws:/home/builder/.aws:ro \
    anyakichi/lambda-rust-sample:main
```

Upload the application to your Lambda environment.

```
[builder@lambda-rust-sample-1 lambda-rust-sample]$ update

or use aws command directly

[builder@lambda-rust-sample-1 lambda-rust-sample]$ aws lambda update-function-code \
    --function-name <function-name> --zip-file fileb://lambda-rust-sample.zip
```

Run the application locally and access to it.

```
$ din -p 8080:8080 anyakichi/lambda-rust-sample:main run -y
$ curl -d '{}' http://localhost:8080/2015-03-31/functions/function/invocations
```

Or use pre-built binary included in the Docker image.

```
$ docker run -p 8080:8080 anyakichi/lambda-rust-sample:main app.lambda_handler
$ curl -d '{}' http://localhost:8080/2015-03-31/functions/function/invocations
```

See [docker-lambda-rust-builder](https://github.com/anyakichi/docker-lambda-rust-builder) for more information.
