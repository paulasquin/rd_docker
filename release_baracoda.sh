# echo Please enter organisation, for instance kolibree or paulasquin
# read ORGANISATION
export ORGANISATION="baracodadailyhealthtech"
export DOCKER_IMAGE_NAME="rd_notebook_cpu"

echo Please enter version number, for instance 0.0.2
read VERSION

# Building
echo Start building images for version ${VERSION}...
# docker build -t ${DOCKER_IMAGE_NAME}:latest -f Dockerfile-notebook.cpu .
# Build with baracoda private packages embedding pip.conf file without exposing secret
DOCKER_BUILDKIT=1 docker build -t ${DOCKER_IMAGE_NAME}:latest --secret id=pipconfig,src=$VIRTUAL_ENV/pip.conf -f Dockerfile-notebook.cpu .
echo Building done.

# Auth
echo Starting docker auth
docker login

# Tag
echo Tagging all versions
docker tag ${DOCKER_IMAGE_NAME}:latest ${ORGANISATION}/${DOCKER_IMAGE_NAME}:latest
docker tag ${DOCKER_IMAGE_NAME}:latest ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${VERSION}


# Push
echo Pushing
docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:latest
docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${VERSION}
echo All done!

