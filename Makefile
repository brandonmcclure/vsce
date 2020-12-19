BUILD_VERBOSE = $(V)

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

IMAGE_NAME := bmcclure89/vsce
TAG := :latest

all: build

build: 
	$(Q)docker build -t $(IMAGE_NAME)$(TAG) .

build_multiarch:
	$(Q)Docker buildx build -t $(IMAGE_NAME)$(TAG) --platform linux/amd64,linux/arm64,linux/arm/v7 .

package:
	$(Q)$$PackageFileName = "$$("$(IMAGE_NAME)" -replace "/","_").tar"; docker save $(IMAGE_NAME)$(TAG) -o $$PackageFileName

publish:
	$(Q)docker login; docker push $(IMAGE_NAME)$(TAG); docker logout
