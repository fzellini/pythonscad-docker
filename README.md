# pythonscad-docker
Compile and run last version of [pythonscad](https://pythonscad.org/) in a docker container

build image with
```
git clone https://github.com/fzellini/pythonscad-docker
cd pythonscad-docker
docker build . -t zef/pythonscad
```

Run with
```
docker run --init  --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY   -v <your shared dir>:/openscad  -v <your home dir>/.config/OpenSCAD:/root/.config/OpenSCAD zef/pythonscad -- --enable all --trust-python
```

Tested in a Linux box with ubuntu 22 and docker installed.

Many thanks to [gsohler](https://github.com/gsohler) for his excellent work to porting python on [openscad](https://openscad.org/)


