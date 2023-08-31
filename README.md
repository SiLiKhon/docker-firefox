# Docker-firefox

Run firefox from a docker image with local X-forwarding

## Usage

```bash
. docker-firefox.sh
```

Note: your profile info (like browsing history and extensions) are kept in a mounted location. The location to mount is set via `DOCKER_FIREFOX_HOME` environment variable, which defaults to `$HOME/.docker_firefox_home`.

## Building the image

Go to the [Firefox download page](https://www.mozilla.org/en-US/firefox/linux/) and download the latest `firefox-*.tar.bz` file. Put the file to the same directory with the `Dockerfile`. Then build the image:

```bash
docker build -t <YOUR_IMAGE_TAG> .
```
