#!/bin/bash

source .env

sudo docker system prune -af --volumes

sudo docker network create db-network

sudo docker-compose up 