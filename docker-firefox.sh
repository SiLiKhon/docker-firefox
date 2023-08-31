XAUTH_FILE=`xauth info | grep 'Authority file' | awk '{print $3}'`
echo XAUTH: $XAUTH_FILE

if [ -z "${DOCKER_FIREFOX_PROFILE_PATH}" ]; then 
    DOCKER_FIREFOX_PROFILE_PATH="$HOME/.docker_firefox_profile"
fi

if [ ! -d $DOCKER_FIREFOX_PROFILE_PATH ]; then
  mkdir $DOCKER_FIREFOX_PROFILE_PATH
fi

docker run --rm -it \
  --name debian-firefox \
  --net=host --env DISPLAY=:0 \
  -v "$XAUTH_FILE:/root/.Xauthority:ro" \
  -v "$DOCKER_FIREFOX_PROFILE_PATH:/root/.mozilla" \
  silikhon/docker-firefox firefox
