# pythonscad-docker
Compile and run last version of [pythonscad](https://pythonscad.org/) in a docker container

build image with
```
git clone https://github.com/fzellini/pythonscad-docker
cd pythonscad-docker/src
docker build . -t zef/pythonscad
```

Run with
```
# xhost + 
docker run --init --rm -u $(id -u):$(id -g) -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY  -e HOME=$HOME -v $HOME:$HOME zef/pythonscad -- --enable all --trust-python
```
or, the easy way, the pyopenscad script

```
./pyopenscad

```

To inspect the container:
```
# xhost + 
docker run --init --rm -it --entrypoint /bin/bash -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY zef/pythonscad
```


Tested in a Linux box with ubuntu 22 and docker installed.

![python enabled](https://github.com/fzellini/pythonscad-docker/blob/main/openscad.png?raw=true)

Many thanks to [gsohler](https://github.com/gsohler) for his excellent work to porting python on [openscad](https://openscad.org/)


