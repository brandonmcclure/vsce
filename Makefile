# kernel-style V=1 build verbosity
ifeq ('$(origin V)', 'command line')
	BUILD_VERBOSE = $(V)
endif
ifeq ($(BUILD_VERBOSE),1)
	Q =
else
	Q = @
endif

ifeq ($(OS),Windows_NT)
	SHELL := pwsh.exe
else
	SHELL := pwsh
endif

.SHELLFLAGS := -NoProfile -Command 
IMAGE_NAME := MyDockerImage
TAG := :latest

all: build

build: docker -t $(IMAGE_NAME)$(TAG) .
