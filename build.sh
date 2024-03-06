#!/bin/bash

image_name='app'

tag='v1'

docker build -t "$image_name:$tag" .

echo "Docker image $image_name:$tag built successfully."
