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