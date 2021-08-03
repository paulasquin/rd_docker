# rd_docker
Docker images definition pour R&D

# Images
## Notebook CPU
Run a notebook from this image automatically without GPU acceleration. 
Useful for Albatros Kubernetes R&D testing at low costs.  

Notes:
- Mediapipe CPU
- OpenCV CPU
- port 8888


## Notebook GPU
Notebook from this image for testing with GPU acceleration of Kubernetes fleet.

Notes:
- Mediapipe GPU
- OpenCV GPU

# Build instructions
## Automated build
To automatically build these docker images, you can run
```bash
sh release_baracoda.sh
```

## Manual build
- Secret management  
Inside the docker image, we embed Baracoda private python packages.
To do this, we need the docker image to use pip.conf credentials, but we cannot provide this file directly with a `COPY`
statement for security reasons. The password would be stored in clear inside docker images going on internet. 
This is why we are using the Docker BuildKit secret management.  

Assuming we can find the pip.conf file at `${VIRUTAL_ENV}/pip.conf`
```bash
DOCKER_BUILDKIT=1 docker build -t image_name:latest --secret id=pipconfig,src=$VIRTUAL_ENV/pip.conf -f Dockerfile .
```

# Run
```bash
docker run -p HOST_PORT:8888 -it image_name:latest
```