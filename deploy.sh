
#!/bin/bash

CONTAINER_NAME=nodejs-docker-jenkins
IMAGE_NAME=nodejs-docker-jenkins

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

if [ "$(docker images -q $IMAGE_NAME)" ]; then
    echo "Removing existing image..."
    docker rmi $IMAGE_NAME -f
fi

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Running Docker container..."
docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME
