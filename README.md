# Docker Directory 

Dockerfile used to create darknet image and train custom data.

# Docker Images contain Darknet 

Docker images for Darknet Yolo v3. [AlexeyAB/darknet](https://github.com/AlexeyAB/darknet "AlexeyAB/darknet").
All of Darknet's images are based on debian.

## How to build the Docker container
```
docker build -t darknet .
```

## How to attach a volumes the container
To create a volumes and attach to a containter do

```
docker run -dit --name darknet -v darknetvol:/darknet/darknet/backup darknet:latest
```

Go inside the container before you can perform some darknet tasks.
```
docker exec -it darknet bash
```

## How to train custom data 
Pre-condition, User need prepare image file, config, and weight file as shown below:
```
Copy all dataset into data/obj/
Copy yolov3-tiny-custom-train.cfg into cfg/
Copy darknet53.conv.74 into backup/
```

To generate train data path in train.txt, run
```
python3 generate_train.py
```

To train custom weight file, run
```
./darknet detector train data/obj.data cfg/yolov3-tiny-custom-train.cfg backup/darknet53.conv.74
```

The final weight file will store in the following location
```
/var/lib/docker/volumes/darknetvol/_data/
```