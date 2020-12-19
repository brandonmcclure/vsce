A simple docker image to run the [vsce](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) program to package and publish VS Code extensions. 

[![Docker Stars](https://img.shields.io/docker/stars/bmcclure89/vsce.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/vsce/) [![Docker Pulls](https://img.shields.io/docker/pulls/bmcclure89/vsce.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/vsce/) [![Build Status](https://dev.azure.com/brandonmcclure89/vsce/_apis/build/status/brandonmcclure.vsce?branchName=main)](https://dev.azure.com/brandonmcclure89/vsce/_build/latest?definitionId=13&branchName=main)

Feel free to add any [issues](https://github.com/brandonmcclure/vsce/issues) that you find, although keep in mind this is a personal project for my occasional VS code extension development. 


## Usage

Install docker on your machine, navigate to the folder with your `package.json` file and run:

```
docker run --rm -v ${PWD}:/work bmcclure89/vsce package -o bin/myExtensionName-myVersion.vsix
```

For an example of how I use this in a Makefile/as part of my workflow see [this file](https://github.com/brandonmcclure/makefile-boilerplate/blob/main/Makefile)

## Build
If you want to build this yourself, you can use the Makefile in this repo to `make build` a image on your platform. Run `make build_multiarch` to build for all of the supported platforms. Note that multi arch builds use [buildx](https://docs.docker.com/buildx/working-with-buildx/) functionality and there are some changes you will need to make to your docker dameon to enable that experimental feature. 

There is also a [azure-pipelines.yml](azure-pipelines.yml) file that you can use to setup CI for the image. 