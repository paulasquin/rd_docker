echo Please enter organisation, for instance kolibree or paulasquin
read ORGANISATION
# export ORGANISATION="kolibree"
export DOCKER_IMAGE_NAME="notebook"

echo Please enter version number, for instance 0.0.2
read VERSION

# Building
echo Start building images for version ${VERSION}...
docker build -t ${DOCKER_IMAGE_NAME}:latest-cpu -f Dockerfile-${DOCKER_IMAGE_NAME}.cpu .
echo Building done.

# Auth
echo Starting docker auth
docker login

# Tag
echo Tagging all versions
docker tag ${DOCKER_IMAGE_NAME}:latest-cpu ${ORGANISATION}/${DOCKER_IMAGE_NAME}:latest-cpu
docker tag ${DOCKER_IMAGE_NAME}:latest-cpu ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${VERSION}-cpu


# Push
echo Pushing
docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:latest-cpu
docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${VERSION}-cpu
echo All done!

