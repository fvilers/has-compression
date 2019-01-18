# has-compression

A docker image to check for web compression at a specific URL

## How to use

```
$ docker run fvilers/has-compression https://www.google.com
The web server compresses the response at .59 ratio.

$ docker run fvilers/has-compression https://localhost:3000
The web server doesn't compress the response.
```
