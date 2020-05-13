# Azure Iot-Hub-c client simulate appication
> Sample app that receives telemetry message and direct method from Azure Iothub from device, and receives telemetry message and device twin from Device to Iothub.

## Build docker image
Create a docker image using dockerfile with the following command.
Currently, it even installs a library for build..
```
$ docker build --tag [docker-image name]:[version] .
    ex) $ docker build --tag iothub-c-client-simulate-app:0.1 .
```

## Pull docker image
You can create and use your own image as above, but it takes a long time, so the docker image is saved in Docker Hub so you can download the pre-built image
```
$ docker login
$ docker pull [docker image path]:[version]
```

## Run docker container
You can build and test within the container by running the image using Docker run.
For ease of source modification, the source to be modified can be used by mounting the volume into the container through the "-v" option.
```
$ docker run -it -u root --rm -v ${PWD}:/home/devuser/iothub-client iothub-c-client-simulate-app:0.1 /bin/bash
```

## Build iothub-client-simulate application
You can access and build in the container with the above command
```
$ source ./build.sh
```

## Run iothub-client-simulate application
Running the test app.
```
$ ./app [Connection String]
```

***
## References
* https://docs.microsoft.com/ko-kr/azure/iot-hub/iot-hub-raspberry-pi-kit-c-get-started
* https://github.com/Azure-Samples/iot-hub-c-raspberrypi-client-app
* https://github.com/Azure/azure-iot-sdk-c/blob/master/doc/devbox_setup.md#linux