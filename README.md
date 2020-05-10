# /docker directory

Dockerfile used to create darknet and Opencv image.

# Docker Images contain Darknet and OpenCV

Docker images for Darknet Yolo v3. [AlexeyAB/darknet](https://github.com/AlexeyAB/darknet "AlexeyAB/darknet")
All of Darknet's images are based on Ubuntu 18.04.

## How to build the Docker container
```
docker build -t darknet .
```

## How to test the docker image
```
To run container in interactive mode (bash) do

```
docker run --rm -it --name darknet darknet:latest bash
```

Inside the container you can perform some darknet tasks like
```
./darknet detector test data/obj.data cfg/yolov3-tiny-custom.cfg backup/yolov3-tiny-custom_2000.weights data/football.png
