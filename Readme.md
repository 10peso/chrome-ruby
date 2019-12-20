# Chrome-ruby

This Dockerfile provides an image that includes Ruby and Chrome. Meant to be used in CI environments or local testing where
you may need both Chrome (for headless mode testing) and Ruby.

image version 1.0.0: uses Ruby 2.4.6 and Chrome 79.0.3945.88-1.

## Usage

To boot straight to the bash shell in the image:

```shell
$ docker run --rm -it 10peso/chrome-ruby bash
```

