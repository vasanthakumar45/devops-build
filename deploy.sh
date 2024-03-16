#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    echo "Specify 'dev' or 'prod' as the target."
    exit 1
fi


if [ "$1" == "dev" ]; then
    
    docker tag "$(docker images -q | head -n 1)" vasanth45/dev_repo:tagname
    
    docker push vasanth45/dev_repo:tagname
    
    docker run -d -p 80:80 vasanth45/dev_repo:tagname
elif [ "$1" == "prod" ]; then
    
    docker tag "$(docker images -q | head -n 1)" vasanth45/prod_repo:tagname
    
    docker push vasanth45/prod_repo:tagname
    
    docker run -d -p 80:80 vasanth45/prod_repo:tagname
else
    echo "Invalid target. Specify 'dev' or 'prod'."
    exit 1
fi
