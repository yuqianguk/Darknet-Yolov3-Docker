# Docker Directory 

Dockerfile used to create darknet, OpenCv and python image.

# Docker Images contain Darknet and OpenCV

Docker images for Darknet Yolo v3. [AlexeyAB/darknet](https://github.com/AlexeyAB/darknet "AlexeyAB/darknet").
All of Darknet's images are based on Ubuntu 18.04.

## How to build the Docker container
```
docker build -t darknet .
```

## How to run the docker image
To run container in interactive mode (bash) do

```
docker run --rm -it --name darknet darknet:latest bash
```

Inside the container you can perform some darknet tasks like
```
./darknet detector test data/obj.data cfg/yolov3-tiny-custom.cfg backup/yolov3-tiny-custom_2000.weights data/football.png
```

## How to train custom data 
To generate train data path in train.txt, run
```
python3 generate_train.py
```

To train custom weight file, run
```
./darknet detector train data/obj.data cfg/yolov3-tiny-custom-train.cfg backup/darknet53.conv.74
```

