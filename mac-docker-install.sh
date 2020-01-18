#!/bin/sh
brew install docker docker-machine
brew cask install virtualbox
docker-machine create --driver virtualbox default
docker-machine env default
eval "$(docker-machine env default)"

