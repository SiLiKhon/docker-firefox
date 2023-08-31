XAUTH_FILE=`xauth info | grep 'Authority file' | awk '{print $3}'`
echo XAUTH: $XAUTH_FILE

if [ -z "${DOCKER_FIREFOX_HOME}" ]; then 
    DOCKER_FIREFOX_HOME="$HOME/.docker_firefox_home"
fi

if [ ! -d $DOCKER_FIREFOX_HOME ]; then
  mkdir -p $DOCKER_FIREFOX_HOME
fi

cp $XAUTH_FILE $DOCKER_FIREFOX_HOME/.Xauthority

docker run --rm -it \
  --name debian-firefox \
  --net=host --env DISPLAY=:0 \
  -e "HOME=/home/ffuser" \
  -u "$(id -u):$(id -g)" \
  -v "$DOCKER_FIREFOX_HOME:/home/ffuser" \
  silikhon/docker-firefox firefox
